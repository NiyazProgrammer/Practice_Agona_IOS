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
    }

}
