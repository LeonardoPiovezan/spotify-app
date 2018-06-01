//
//  SpotifyServiceImpl.swift
//  SpotifyApp
//
//  Created by Leonardo Piovezan on 31/05/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import Foundation
import RxSwift

class SpotifyServiceImpl: SpotifyService {

    private let auth: SPTAuth
    private let scopes: [Any]
    private var loginURL: URL!

    init(auth: SPTAuth,
         scopes: [Any]) {
        self.auth = auth
        self.scopes = scopes
        configureSpotifyAuth()
    }
    private func configureSpotifyAuth() {
        auth.clientID = SPOTIFY_CLIENT_ID
        auth.redirectURL = URL(string: SPOTIFY_REDIRECT_URL)
        auth.requestedScopes = scopes
    }


    func login() -> Single<Bool> {

        self.loginURL = auth.spotifyWebAuthenticationURL()
        return Single<Bool>.create {[loginURL] single in

            if let `loginURL` = loginURL {
                UIApplication.shared.open(loginURL, options: [:], completionHandler: { completed in
                    single(.success(completed))
                })
            }
            return Disposables.create()
        }

    }


}
