import UIKit
class EditScreenViewController: BaseViewController {
    private let editView = EditScreenView(frame: .zero)
    private var viewModel: EditScreenViewModel?

    init(viewModel: EditScreenViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = editView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Обо мне"
        createChangeDataCards()
    }

    private func createChangeDataCards() {
        let dataManager = DataManager()
        for card in dataManager.changeDataCards {
            card.dataTextField.delegate = self
            editView.dataCardsSV.addArrangedSubview(card)
        }
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
