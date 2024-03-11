import UIKit

protocol ProfileViewDelegate: AnyObject {
    func didPressCard(cardId: Int)
}
class ProfileView: UIView {
    
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

    lazy var generalTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.register(GeneralProfileTableViewCell.self, forCellReuseIdentifier: GeneralProfileTableViewCell.reuseIdentifier)
        return table
    }()

    var mainExpenseAndIcomeStackView: UIStackView?

    weak var delegate: ProfileViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(backgraoundImageProfile)
        addSubview(profileImage)
        addSubview(nameLabel)
        addSubview(generalLabel)
        addSubview(generalTable)
        
        createStackViews()
        setupContrait()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createStackViews() {
        let expenseStackView = createVerticalStackView([expenseLabel, expenseNumberLabel])
        let incomeStackView = createVerticalStackView([incomeLabel, incomeNumberLabel])

        mainExpenseAndIcomeStackView = UIStackView(arrangedSubviews: [expenseStackView, incomeStackView])
        mainExpenseAndIcomeStackView?.translatesAutoresizingMaskIntoConstraints = false
        mainExpenseAndIcomeStackView?.axis = .horizontal
        mainExpenseAndIcomeStackView?.distribution = .fillEqually
        addSubview(mainExpenseAndIcomeStackView!)
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

    func setupContrait() {
        NSLayoutConstraint.activate([
            backgraoundImageProfile.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backgraoundImageProfile.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgraoundImageProfile.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgraoundImageProfile.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3),

            profileImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: backgraoundImageProfile.topAnchor, constant: 50),
            profileImage.widthAnchor.constraint(equalToConstant: 150),
            profileImage.heightAnchor.constraint(equalToConstant: 150),

            nameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            mainExpenseAndIcomeStackView!.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 40),
            mainExpenseAndIcomeStackView!.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainExpenseAndIcomeStackView!.trailingAnchor.constraint(equalTo: trailingAnchor),

            generalLabel.topAnchor.constraint(equalTo: mainExpenseAndIcomeStackView!.bottomAnchor, constant: 30),
            generalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            generalTable.topAnchor.constraint(equalTo: generalLabel.bottomAnchor, constant: 20),
            generalTable.leadingAnchor.constraint(equalTo: leadingAnchor),
            generalTable.trailingAnchor.constraint(equalTo: trailingAnchor),
            generalTable.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),

        ])

    }
}
extension ProfileView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(
            withIdentifier: GeneralProfileTableViewCell.reuseIdentifier, for: indexPath
        ) as? GeneralProfileTableViewCell {
            cell.selectionStyle = .none

            let titleObject = Resources.Strings.GeneralCardsProfile.self
            let imageObject = Resources.Images.GeneralCardsProfile.self

            switch indexPath.row {
            case 0:
                cell.configure(with: titleObject.setting, image: imageObject.setting!, color: .lightGray )
                break
            case 1:
                cell.configure(with: titleObject.favorites, image: imageObject.favorites!, color: UIColor(hexString: "#fef5e4"))
            case 2:
                cell.configure(with: titleObject.notification, image: imageObject.notification!, color: UIColor(hexString: "#feeaeb"))
                break
            default:
                break
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }

}
extension ProfileView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didPressCard(cardId: indexPath.row)
    }
}
