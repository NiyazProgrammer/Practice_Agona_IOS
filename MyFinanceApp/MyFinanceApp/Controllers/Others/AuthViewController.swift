//
//  AuthViewController.swift
//  MyFinanceApp
//
//  Created by Нияз Ризванов on 20.04.2024.
//

import UIKit

class AuthViewController: UIViewController {

    var completionHandler: ((Bool) -> Void)?

    private lazy var signInBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Sign in", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 20
        btn.clipsToBounds = true
        let action = UIAction { [weak self] _ in
            DispatchQueue.main.async {
                self?.navigationController?.popViewController(animated: true)
                self?.completionHandler?(true)
            }
        }
        btn.addAction(action, for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Please to sign"
        view.backgroundColor = .white

        view.addSubview(signInBtn)

        signInBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-30)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
        }
    }
}
