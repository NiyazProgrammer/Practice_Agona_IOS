import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
}
@objc extension BaseViewController {
    func addViews() {}
    func layoutViews() {}
    func configure() {
        view.backgroundColor = Resources.Colors.backgroundViews
    }
}
