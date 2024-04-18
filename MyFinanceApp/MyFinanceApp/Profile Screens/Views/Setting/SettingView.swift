import UIKit
private enum NumberSecurityCard {
    static let appsPassword = 0
    static let changePasword = 1
    static let PushNotification = 2
}
protocol SettingViewDelegate: AnyObject {
    func didPressAppsPasswordCard()
    func didPressChangePasswordCard()
    func didPressPushNotificationCard()
}
protocol SettingViewForButtonDelegate: AnyObject {
    func didPressButtonEdit()
}
class SettingView: UIView {
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
    
    lazy var imageUser: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "steveJob"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()

    lazy var nameUser: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Steve Job"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    lazy var emailUser: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "steve@gmail.com"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    lazy var nameAndEmailStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameUser, emailUser])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()

    lazy var editButton: UIButton = {
        let action = UIAction { [weak self] _ in
            self?.editButtondelegate?.didPressButtonEdit()
        }
        let button = UIButton(type: .system,primaryAction: action)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.backgroundColor = Resources.Colors.mainColorApp
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()

    lazy var securityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Безопасность"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()

    private let securityCardsSV: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    weak var delegate: SettingViewDelegate?
    weak var editButtondelegate: SettingViewForButtonDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageUser)
        contentView.addSubview(nameAndEmailStackView)
        contentView.addSubview(editButton)
        contentView.addSubview(securityLabel)
        contentView.addSubview(securityCardsSV)

        setupLayout()

        createAllCards()
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

            imageUser.topAnchor.constraint(equalTo:  contentView.topAnchor, constant: 20),
            imageUser.leadingAnchor.constraint(equalTo:  contentView.leadingAnchor, constant: 20),
            imageUser.widthAnchor.constraint(equalToConstant: 60),
            imageUser.heightAnchor.constraint(equalToConstant: 60),

            nameAndEmailStackView.topAnchor.constraint(equalTo: imageUser.topAnchor),
            nameAndEmailStackView.leadingAnchor.constraint(equalTo: imageUser.trailingAnchor, constant: 15),
            nameAndEmailStackView.trailingAnchor.constraint(equalTo:  contentView.trailingAnchor, constant: -20),

            editButton.topAnchor.constraint(equalTo: imageUser.bottomAnchor, constant: 20),
            editButton.leadingAnchor.constraint(equalTo:  contentView.leadingAnchor, constant: 20),
            editButton.trailingAnchor.constraint(equalTo:  contentView.trailingAnchor, constant: -20),
            editButton.heightAnchor.constraint(equalToConstant: 30),

            securityLabel.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 40),
            securityLabel.leadingAnchor.constraint(equalTo: editButton.leadingAnchor),

            securityCardsSV.topAnchor.constraint(equalTo: securityLabel.bottomAnchor, constant: 20),
            securityCardsSV.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            securityCardsSV.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            securityCardsSV.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    private func createCard(numbersCard: Int, withTapHandler tapHandler: Selector) {
        let dataManager = DataManager()
        let card = dataManager.securityCardsSetting[numbersCard]
        let tapGesture = UITapGestureRecognizer(target: self, action: tapHandler)
        card.addGestureRecognizer(tapGesture)
        securityCardsSV.addArrangedSubview(card)
    }

    private func createAllCards() {
        createCard(
            numbersCard: NumberSecurityCard.appsPassword,
            withTapHandler: #selector(handleAppsPasswordCardTap(_:))
        )
        createCard(
            numbersCard: NumberSecurityCard.changePasword,
            withTapHandler: #selector(handleChangePasswordCardTap(_:))
        )
        createCard(
            numbersCard: NumberSecurityCard.PushNotification,
            withTapHandler: #selector(handlePushNotificationCardTap(_:))
        )
    }

    @objc func handleAppsPasswordCardTap(_ sender: UITapGestureRecognizer) {
        delegate?.didPressAppsPasswordCard()
    }

    @objc func handleChangePasswordCardTap(_ sender: UITapGestureRecognizer) {
        delegate?.didPressChangePasswordCard()
    }

    @objc func handlePushNotificationCardTap(_ sender: UITapGestureRecognizer) {
        delegate?.didPressPushNotificationCard()
    }
}
