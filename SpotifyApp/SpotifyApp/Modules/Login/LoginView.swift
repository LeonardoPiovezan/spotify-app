//
//  LoginView.swift
//  SpotifyApp
//
//  Created by Leonardo Piovezan on 31/05/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginView: UIViewController {

    @IBOutlet weak var loginButton: UIButton!

    var viewModel: LoginViewModel!
    var service: SpotifyService
    let disposeBag = DisposeBag()

    init(service: SpotifyService) {
        self.service = service
        super.init(nibName: String(describing: LoginView.self), bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setUpViewModel()
        setUpBindings()
    }

    func configureView() {

    }

    func setUpBindings() {

        self.viewModel.signedIn.drive(onNext: { _ in
            print("boaaa")
        }).disposed(by: disposeBag)
    }

    func setUpViewModel() {
        self.viewModel = LoginViewModel(input: self.loginButton.rx.tap.asSignal(), service: self.service)
    }
}
