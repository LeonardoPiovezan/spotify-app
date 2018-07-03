//
//  LoginViewModel.swift
//  SpotifyApp
//
//  Created by Leonardo Piovezan on 31/05/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class LoginViewModel {

    let signedIn: Driver<Bool>

    let signInSuccess = PublishSubject<Bool>()
    let signInError = PublishSubject<Bool>()

    private let service: SpotifyService
    private let disposeBag = DisposeBag()

    init(input: (Signal<Void>), service: SpotifyService) {

        self.service = service
        
        self.signedIn = input.flatMapLatest {
            return service.login().map { completed in
                return completed
            }.asDriver(onErrorJustReturn: true)
        }

        self.signedIn.drive(onNext: { [weak self](response) in
            if response {
                self?.signInSuccess.onNext(true)
            } else {
                self?.signInError.onNext(false)
            }
        }).disposed(by: disposeBag)
    }
}
