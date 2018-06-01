//
//  DefaultContainer+Views.swift
//  SpotifyApp
//
//  Created by Leonardo Piovezan on 31/05/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import Foundation

extension DefaultContainer {
    func registerViews() {
        self.container.register(LoginView.self) { _ in
            LoginView()
        }

    }
}
