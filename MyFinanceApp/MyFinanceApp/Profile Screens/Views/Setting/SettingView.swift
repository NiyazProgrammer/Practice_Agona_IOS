import UIKit

class SettingView: UIView {

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
        let action = UIAction { _ in
            // action edit profile data
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

    lazy var securityTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.register(SecurityTableViewCell.self, forCellReuseIdentifier: SecurityTableViewCell.reuseIdentifier)
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageUser)
        addSubview(nameAndEmailStackView)
        addSubview(editButton)
        addSubview(securityLabel)
        addSubview(securityTable)

        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageUser.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            imageUser.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageUser.widthAnchor.constraint(equalToConstant: 60),
            imageUser.heightAnchor.constraint(equalToConstant: 60),

            nameAndEmailStackView.topAnchor.constraint(equalTo: imageUser.topAnchor),
            nameAndEmailStackView.leadingAnchor.constraint(equalTo: imageUser.trailingAnchor, constant: 15),
            nameAndEmailStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            editButton.topAnchor.constraint(equalTo: imageUser.bottomAnchor, constant: 20),
            editButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            editButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            editButton.heightAnchor.constraint(equalToConstant: 30),

            securityLabel.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 40),
            securityLabel.leadingAnchor.constraint(equalTo: editButton.leadingAnchor),

            securityTable.topAnchor.constraint(equalTo: securityLabel.bottomAnchor, constant: 20),
            securityTable.leadingAnchor.constraint(equalTo: leadingAnchor),
            securityTable.trailingAnchor.constraint(equalTo: trailingAnchor),
            securityTable.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),

            
        ])
    }
}
extension SettingView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(
            withIdentifier: SecurityTableViewCell.reuseIdentifier, for: indexPath
        ) as?  SecurityTableViewCell {
            cell.selectionStyle = .none

            let titleObject = Resources.Strings.SecurityCardsProfile.self
            let imageObject = Resources.Images.SecurityCardsProfile.self

            switch indexPath.row {
            case 0:
                cell.configure(with: titleObject.codePassword, image: imageObject.codePassword!, color: .green)
                break
            case 1:
                cell.configure(with: titleObject.changePassword, image: imageObject.changePassword!, color: .lightGray)
            case 2:
                cell.configure(with: titleObject.notification, image: imageObject.notification!, color: UIColor(hexString: "#f84608"))
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
