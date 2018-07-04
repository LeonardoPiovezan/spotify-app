//
//  MockSpotifyService.swift
//  SpotifyAppTests
//
//  Created by Leonardo Piovezan on 03/07/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

@testable import SpotifyApp
import RxSwift

class MockSpotifyService: SpotifyService {

    var loginResult:Bool
    init(result:Bool) {
        self.loginResult = result
    }

    func login() -> Single<Bool> {
        return Single.just(loginResult)
    }

    func setResult(result: Bool) {
        loginResult = result
    }
}
