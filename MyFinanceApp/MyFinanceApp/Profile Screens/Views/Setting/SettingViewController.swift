import UIKit

class SettingViewController: BaseViewController {

    private let settingView = SettingView(frame: .zero)

    override func loadView() {
        view = settingView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Настройки"

        settingView.editButtondelegate = self
    }

}

extension SettingViewController: SettingViewDelegate {
    func didPressAppsPasswordCard() {
        //
    }

    func didPressChangePasswordCard() {
        //
    }

    func didPressPushNotificationCard() {
        //
    }
}

extension SettingViewController: SettingViewForButtonDelegate {
    func didPressButtonEdit() {
        let viewModel = EditScreenViewModel()
        let editController = EditScreenViewController(viewModel: viewModel)
        navigationController?.pushViewController(editController, animated: true)
    }
}
