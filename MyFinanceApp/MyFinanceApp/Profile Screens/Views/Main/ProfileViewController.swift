import UIKit

class ProfileViewController: BaseViewController {

    
    private var profileView = ProfileView(frame: .zero)

    override func loadView() {
        view = profileView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()

        title = "Мои деньги"

    }

    func setupNavigationBar() {
        navigationItem.title = "Профиль"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
    }

}

