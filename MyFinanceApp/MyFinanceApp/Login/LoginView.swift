import UIKit
import SnapKit

class LoginView: UIView {

    private let startbButton: UIButton = {
        let action = UIAction { _ in
            
        }
        let button = UIButton(type: .system, primaryAction: action)
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20

        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(startbButton)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        startbButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
}
