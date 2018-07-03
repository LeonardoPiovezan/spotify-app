//
//  DefaultContainer+Views.swift
//  SpotifyApp
//
//  Created by Leonardo Piovezan on 31/05/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

extension DefaultContainer {
    func registerViews() {
        self.container.register(LoginView.self) { resolver in
            LoginView(service: resolver.resolve(SpotifyService.self)!)
        }

        self.container.register(SearchView.self) { _ in
            SearchView()
        }
    }
}
