import UIKit
import SwiftUI

class WelcomeViewController: UIViewController {

    private var welcomeView = WelcomeView(frame: .zero)

    override func loadView() {
        view = welcomeView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Welcome to App"
        view.backgroundColor = .lightGray

        welcomeView.switchToAuthScreen = { [weak self] in
            let vc = UIHostingController(rootView: LoginView())
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }

    private func handleSignIn(success: Bool) {
        guard success else {
            let alert = UIAlertController(
                title: "Oops",
                message: "Что-то пошло не так при входе в систему",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
            present(alert, animated: true)
            return
        }

        let mainAppTabBarVC = TabBarController()
        mainAppTabBarVC.modalPresentationStyle = .fullScreen
        present(mainAppTabBarVC, animated: true)
    }
}
