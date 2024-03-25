import UIKit

class EditScreenView: UIView {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .clear
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var avatarImage: UIImageView = {
        let avatar = UIImageView(image: Resources.Images.ChangeDataCards.defaultAvatar)
        avatar.contentMode = .scaleAspectFit
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.layer.cornerRadius = 40
        avatar.clipsToBounds = true
        return avatar
    }()

    let dataCardsSV: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.backgroundColor = .clear
        stackView.distribution = .fillEqually
        return stackView
    }()

    private let editAvatarbutton: UIButton = {
        let action = UIAction {_ in 
            
        }
        let button = UIButton(type: .system, primaryAction: action)
        button.setImage(<#T##image: UIImage?##UIImage?#>, for: <#T##UIControl.State#>)
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(avatarImage)
        contentView.addSubview(dataCardsSV)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),

            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            avatarImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            avatarImage.widthAnchor.constraint(equalToConstant: 80),
            avatarImage.heightAnchor.constraint(equalToConstant: 80),

            dataCardsSV.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 30),
            dataCardsSV.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dataCardsSV.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dataCardsSV.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}


