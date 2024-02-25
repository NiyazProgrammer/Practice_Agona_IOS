import UIKit

class ViewController: UIViewController {

    lazy var titile: UILabel = {
        let titile = UILabel()
        titile.text = "My finance"
        titile.textColor = .black
        titile.font = UIFont.systemFont(ofSize: 24)
        titile.translatesAutoresizingMaskIntoConstraints = false
        return titile
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titile)
        view.backgroundColor = .white
        setupContrait()
    }

    func setupContrait() {
        NSLayoutConstraint.activate([
            titile.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titile.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

