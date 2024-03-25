//
//  LoginViewController.swift
//  MyFinanceApp
//
//  Created by Нияз Ризванов on 21.03.2024.
//

import UIKit

class LoginViewController: BaseViewController {
    private let loginView: LoginView = .init(frame: .zero)
    private let viewModel: LoginViewModel

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()


    }

}
