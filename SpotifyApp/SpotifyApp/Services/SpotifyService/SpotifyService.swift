//
//  SpotifyService.swift
//  SpotifyApp
//
//  Created by Leonardo Piovezan on 31/05/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol SpotifyService {
    func login() -> Single<Bool>
}
