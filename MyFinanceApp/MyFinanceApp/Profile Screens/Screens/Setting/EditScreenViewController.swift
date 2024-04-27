import UIKit
import Combine

class EditScreenViewController: BaseViewController {
    private let editView = EditScreenView(frame: .zero)
    private var viewModel: EditScreenViewModel
    private var currentUser: User?
    private var cancellable: Set<AnyCancellable> = []

    let imagePicker = ImagePicker()

    init(viewModel: EditScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        view = editView
        editView.didTapEditAvatarImage = { [weak self] in
            self?.imagePicker.showImagePicker(in: self ?? UIViewController()) { result in
                self?.editView.avatarImage.image = result
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Обо мне"
        createChangeDataCards()
        setupBindings()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.setCurrentUser()
        editView.configure(user: currentUser ?? User())
    }

    private func createChangeDataCards() {
        let dataManager = DataManager()
        for card in dataManager.changeDataUsersCards {
            card.dataTextField.delegate = self
            editView.dataCardsSV.addArrangedSubview(card)
        }
    }

    private func setupBindings() {
        viewModel.$currentUser.sink { user in
            self.currentUser = user
        }.store(in: &cancellable)
    }
}

extension EditScreenViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        for card in editView.dataCardsSV.arrangedSubviews {
            (card as? ChangeDataUserCardView)?.dataTextField.resignFirstResponder()
        }
        return true
    }
}
