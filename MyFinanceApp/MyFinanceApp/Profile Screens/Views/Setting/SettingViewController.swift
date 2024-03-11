import UIKit

class SettingViewController: BaseViewController {

    private let settingView = SettingView(frame: .zero)

    override func loadView() {
        view = settingView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Настройки"

    }

}
