//
//  DescriptionNotificatiionViewController.swift
//  MyFinanceApp
//
//  Created by Нияз Ризванов on 10.04.2024.
//

import UIKit

protocol DescriptionNotificatiionViewControllerDelegate: NSObject {
    func setNotificationsInfo(info: String)
}
class DescriptionNotificatiionViewController: BaseViewController {
    private let descriptionView = DescriptionNotificatiionView(frame: .zero)
    private var viewModel: DescriptionNotificatiionViewModel

    init(viewModel: DescriptionNotificatiionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = descriptionView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
