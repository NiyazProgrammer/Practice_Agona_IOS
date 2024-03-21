import UIKit
private enum NumberCard {
    static let setting = 0
    static let favorites = 1
    static let notification = 2
}
protocol ProfileViewDelegate: AnyObject {
    func didPressSettingCard()
    func didPressFavoritesCard()
    func didPressNotificationCard()
}
class ProfileView: UIView {
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

    lazy var backgraoundImageProfile: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "backgroundImageProfile")
        return imageView
    }()

    lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "steveJob")
        imageView.layer.cornerRadius = 75
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 7.0
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Steve Job"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.sizeToFit()
        return label
    }()

    lazy var expenseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Расход"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    lazy var expenseNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10000"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()

    lazy var incomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Доход"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    lazy var incomeNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10000"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()

    lazy var generalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Главная"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()

    private lazy var mainExpenseAndIcomeStackView: UIStackView = {
        let expenseStackView = createVerticalStackView([expenseLabel, expenseNumberLabel])
        let incomeStackView = createVerticalStackView([incomeLabel, incomeNumberLabel])

        let mainExpenseAndIcomeStackView = UIStackView(arrangedSubviews: [expenseStackView, incomeStackView])
        mainExpenseAndIcomeStackView.translatesAutoresizingMaskIntoConstraints = false
        mainExpenseAndIcomeStackView.axis = .horizontal
        mainExpenseAndIcomeStackView.distribution = .fillEqually
        return mainExpenseAndIcomeStackView
    }()

    private let generalCardsSV: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()

    weak var delegate: ProfileViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(backgraoundImageProfile)
        contentView.addSubview(profileImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(generalLabel)
        contentView.addSubview(mainExpenseAndIcomeStackView)
        contentView.addSubview(generalCardsSV)

        createAllCards()
        setupContrait()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createVerticalStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }

    private func createCard(numbersCard: Int, withTapHandler tapHandler: Selector) {
        let card = DataManager.shared.generalCardsMainProfile[numbersCard]
        let tapGesture = UITapGestureRecognizer(target: self, action: tapHandler)
        card.addGestureRecognizer(tapGesture)
        generalCardsSV.addArrangedSubview(card)
    }

    private func createAllCards() {
        createCard(
            numbersCard: NumberCard.setting,
            withTapHandler: #selector(handleSettingCardTap(_:))
        )
        createCard(
            numbersCard: NumberCard.favorites,
            withTapHandler: #selector(handleFavoiritesCardTap(_:))
        )
        createCard(
            numbersCard: NumberCard.notification,
            withTapHandler: #selector(handleNotificationCardTap(_:))
        )
    }

    @objc func handleSettingCardTap(_ sender: UITapGestureRecognizer) {
        delegate?.didPressSettingCard()
    }

    @objc func handleFavoiritesCardTap(_ sender: UITapGestureRecognizer) {
        delegate?.didPressFavoritesCard()
    }

    @objc func handleNotificationCardTap(_ sender: UITapGestureRecognizer) {
        delegate?.didPressNotificationCard()
    }

    func setupContrait() {
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

            backgraoundImageProfile.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgraoundImageProfile.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgraoundImageProfile.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgraoundImageProfile.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.5),

            profileImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: backgraoundImageProfile.bottomAnchor, constant: -75),
            profileImage.widthAnchor.constraint(equalToConstant: 150),
            profileImage.heightAnchor.constraint(equalToConstant: 150),

            nameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            mainExpenseAndIcomeStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 40),
            mainExpenseAndIcomeStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainExpenseAndIcomeStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            generalLabel.topAnchor.constraint(equalTo: mainExpenseAndIcomeStackView.bottomAnchor, constant: 60),
            generalLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            generalCardsSV.topAnchor.constraint(equalTo: generalLabel.bottomAnchor, constant: 20),
            generalCardsSV.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            generalCardsSV.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            generalCardsSV.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}
