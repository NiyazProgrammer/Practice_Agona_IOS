import UIKit

class FavoritesViewController: BaseViewController {

    private var favoritesView = FavoritesView(frame: .zero)
    private let viewModel: FavoritesViewModel

    private var newsCards: [News] = []

    init(viewModel: FavoritesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        view = favoritesView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Избранные"
        newsCards = viewModel.getFirstNews()
        favoritesView.lentaNewsTable.dataSource = self
        favoritesView.lentaNewsTable.delegate = self
    }

}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsCards.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "LentaNews", for: indexPath) as? LentaFavorireNewsTableViewCell {
            let news = newsCards[indexPath.row]
            cell.configure(with: news)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
