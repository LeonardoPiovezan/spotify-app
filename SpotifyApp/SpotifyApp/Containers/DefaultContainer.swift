//
//  DefaultContainer.swift
//  SpotifyApp
//
//  Created by Leonardo Piovezan on 31/05/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import Foundation
import Swinject

final class DefaultContainer {

    let container: Container

    init() {
        self.container = Container()
        registerViews()
    }
}
