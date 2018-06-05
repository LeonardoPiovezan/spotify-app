//
//  SearchCoordinator.swift
//  SpotifyApp
//
//  Created by Leonardo Augusto Piovezan on 04/06/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import Foundation
import Swinject

class SearchCoordinator: Coordinator {
    
    let window: UIWindow
    let container: Container
    
    init(window: UIWindow,
         container: Container) {
        self.window = window
        self.container = container
    }
    
    func start() {
        let searchView = container.resolve(SearchView.self)!
        self.window.rootViewController = searchView
    }
}
