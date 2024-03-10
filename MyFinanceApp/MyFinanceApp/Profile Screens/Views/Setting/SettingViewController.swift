import UIKit

class SettingViewController: UIViewController {

    private let settingView = SettingView(frame: .zero)

    override func loadView() {
        view = settingView
    }

    override func viewDidLoad() {
        super.viewDidLoad()


    }

}
