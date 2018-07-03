//
//  DefaultContainer+Services.swift
//  SpotifyApp
//
//  Created by Leonardo Piovezan on 02/07/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

extension DefaultContainer {
    func registerServices() {
        container.register(SpotifyService.self) { _ in
            SpotifyServiceImpl(auth: SPTAuth.defaultInstance(), scopes: SPOTIFY_SCOPES)
        }
    }
}
