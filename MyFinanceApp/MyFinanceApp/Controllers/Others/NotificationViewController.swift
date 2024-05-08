import UIKit

class NotificationViewController: BaseViewController {
    private var notificationView = NotificationView(frame: .zero)
    private let viewModel: NotificationViewModel

    // MARK: Сделал пока временный массив

    private var notifications: [Notification] = []

    init(viewModel: NotificationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = notificationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Уведомления"

        notificationView.notificationTable.dataSource = self
        notificationView.notificationTable.delegate = self
        notificationView.notificationTable.allowsMultipleSelectionDuringEditing = true

        notifications = viewModel.updateNotifications()
        setupNavBar()
    }

    private let tabBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()

    private func setupNavBar() {
        let clearButton = UIBarButtonItem(title: "Выбрать", style: .plain, target: self, action: #selector(clearButtonTapped))
        navigationItem.rightBarButtonItem = clearButton
    }

    @objc func clearButtonTapped() {
        notificationView.notificationTable.setEditing(!notificationView.notificationTable.isEditing, animated: true)
    }
}

extension NotificationViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notifications.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Notifications", for: indexPath) as? NotificationsTableViewCell {
            cell.selectionStyle = .default
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            notifications.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let notification = notifications[indexPath.row]
        let descriptionViewModel = DescriptionNotificatiionViewModel(descriptionNotificatiion: notification)
        let controller = DescriptionNotificatiionViewController(viewModel: descriptionViewModel)
        navigationController?.pushViewController(controller, animated: true)
        // MARK: Убирает выделение ячейки - не корректно работала
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
