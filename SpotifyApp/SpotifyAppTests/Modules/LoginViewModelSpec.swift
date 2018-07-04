//
//  LoginViewModelSpec.swift
//  SpotifyAppTests
//
//  Created by Leonardo Piovezan on 02/07/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import Quick
import Nimble
import RxSwift
import RxCocoa

@testable import SpotifyApp

class LoginViewModelSpec: QuickSpec {

    override func spec() {

        let signInTap = PublishSubject<Void>()
        let service = MockSpotifyService(result: true)
        let subject = LoginViewModel(input: signInTap.asSignal(onErrorJustReturn: ()),
                                     service: service)
        let disposeBag = DisposeBag()
        beforeEach {

        }

        describe("Login View Behavior") {
            it("Sign in check success") {
                var result: Bool!
                service.setResult(result: true)
                subject.signedIn.drive(onNext: { signedIn in
                    result = signedIn
                }).disposed(by: disposeBag)
                signInTap.onNext(())

                expect(result).toEventually(equal(true))
            }

            it("Sign in check failure") {
                var result: Bool!
                service.setResult(result: false)
                subject.signedIn.drive(onNext: { signedIn in
                    result = signedIn
                }).disposed(by: disposeBag)
                signInTap.onNext(())

                expect(result).toEventually(equal(false))
            }
        }

    }
}
