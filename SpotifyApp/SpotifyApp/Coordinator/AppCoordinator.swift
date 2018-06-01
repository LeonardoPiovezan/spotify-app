//
//  AppCoordinator.swift
//  SpotifyApp
//
//  Created by Leonardo Piovezan on 31/05/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import Foundation
import Swinject

class AppCoordinator: Coordinator {

    let window: UIWindow
    let container: Container

    var loginCoordinator: LoginCoordinator?

    init(window: UIWindow, container: Container) {
        self.window = window
        self.container = container
    }

    func start() {
        showLogin()
    }

    private func showLogin() {
        self.loginCoordinator  = LoginCoordinator(window: window, container: container)
        self.loginCoordinator?.start()
    }


}
