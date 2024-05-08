import UIKit

class NotificationView: UIView {

    lazy var notificationTable: UITableView = {
        let table = UITableView()
        table.estimatedRowHeight = 150
        table.register(NotificationsTableViewCell.self, forCellReuseIdentifier: "Notifications")
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(notificationTable)

        notificationTable.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

