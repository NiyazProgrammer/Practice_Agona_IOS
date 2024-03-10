//
//  NotificationViewController.swift
//  MyFinanceApp
//
//  Created by Нияз Ризванов on 05.03.2024.
//

import UIKit

class NotificationViewController: BaseViewController {

    private var notificationView = NotificationView(frame: .zero)

//    private let viewModel: NotificationViewModel

//    init(viewModel: NotificationViewModel) {
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    override func loadView() {
        view = notificationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Уведомления"
    }

}
