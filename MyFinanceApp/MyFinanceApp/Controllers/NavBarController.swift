import UIKit

final class NavBarController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }

    func configure() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: UIColor(.black),
            .font: Resources.Fonts.helveticaRegular(with: 17)
        ]

//        navigationBar.addBottomBorder(with: Resources.Colors.separator, height: 1)
    }
}
