import UIKit

class ProfileViewController: BaseViewController {
    
    private var profileView = ProfileView(frame: .zero)

    private let viewModel: ProfileViewModel
   
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = profileView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        title = "Профиль"
        profileView.delegate = self

    }

    func setupNavigationBar() {
        navigationItem.title = "Профиль"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
    }

}
extension ProfileViewController: ProfileViewDelegate{
    func didPressSettingCard() {
        navigationController?.pushViewController(SettingViewController(), animated: true)
    }
    
    func didPressFavoritesCard() {
        navigationController?.pushViewController(FavoritesViewController(), animated: true)
    }
    
    func didPressNotificationCard() {
        navigationController?.pushViewController(NotificationViewController(), animated: true)
    }
}
