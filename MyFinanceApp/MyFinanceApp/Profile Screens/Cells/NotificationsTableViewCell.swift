import UIKit

class NotificationsTableViewCell: UITableViewCell {

    private lazy var bellIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "notification")
        return imageView
    }()
    
    // MARK: Временно убрал так не подходит
//    private lazy var titleNotification: UILabel = {
//        let label = UILabel()
//        label.text = "Transfer Status"
//        label.textColor = Resources.Colors.mainColorApp
//        label.font = .systemFont(ofSize: 18, weight: .bold)
//        return label
//    }()

    private lazy var dateInfo: UILabel = {
        let label = UILabel()
        label.text = "5h ago"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    private lazy var descriptionNotification: UILabel = {
        let label = UILabel()
        label.text = "Проблема здесь в том, что в вашем коде вы пытаетесь использовать self внутри замыкания при инициализации lazy var notificationTable: UITableView, но в этом контексте self еще не инициализирован. Чтобы решить эту проблему, вы можете обернуть установку"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bellIcon)
        contentView.addSubview(dateInfo)
        contentView.addSubview(descriptionNotification)

        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        bellIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }

        // MARK: Пока не нужно
        //        titleNotification.snp.makeConstraints { make in
        //            make.top.equalToSuperview().offset(10)
        //            make.leading.equalTo(bellIcon.snp.trailing).offset(15)
        //        }

        dateInfo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
        descriptionNotification.snp.makeConstraints { make in
            make.top.equalTo(bellIcon.snp.bottom).offset(10)
            make.leading.equalTo(bellIcon.snp.trailing).offset(15)
            make.trailing.equalToSuperview().offset(-30)
            make.bottom.equalToSuperview().offset(-30)
            make.height.equalTo(50)
        }
    }

    func configure(with notification: Notification) {
        descriptionNotification.text = notification.description
        dateInfo.text = "\(notification.dateInfo) ago"
    }
}
