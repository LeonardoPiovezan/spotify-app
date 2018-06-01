//
//  LoginCoordinator.swift
//  SpotifyApp
//
//  Created by Leonardo Piovezan on 31/05/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import Foundation
import Swinject

class LoginCoordinator: Coordinator {

    let window: UIWindow
    let container: Container

    init(window: UIWindow,
         container: Container) {
        self.window = window
        self.container = container
    }

    func start() {
        let loginView = container.resolve(LoginView.self)!
        self.window.rootViewController = loginView
    }
}
