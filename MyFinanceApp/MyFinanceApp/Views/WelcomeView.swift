import UIKit

// MARK: Можно добавить анимацию в качестве приветствия или картинку
class WelcomeView: UIView {
    var switchToAuthScreen: (() -> Void)?
    lazy var signInBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Sign in", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 20
        btn.clipsToBounds = true
        let action = UIAction { [weak self] _ in
            self?.switchToAuthScreen?()
        }
        btn.addAction(action, for: .touchUpInside)
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(signInBtn)

        signInBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-30)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
