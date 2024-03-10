import UIKit

enum Tabs: Int {
    case myMoney
    case budget
    case lenta
    case courses
    case profile
}

final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        tabBar.backgroundColor = .white

        tabBar.tintColor = Resources.Colors.active
        tabBar.barTintColor = Resources.Colors.inactive

//        tabBar.layer.borderColor = Resources.Colors.separator.cgColor
//        tabBar.layer.borderWidth = 1
//        tabBar.layer.masksToBounds = true // позволяет содержимому внутри tabBara не выходить за его границы

        let myMoneyController = UIViewController()
        let budgetController = UIViewController()
        let lentaController = UIViewController()
        let coursesController = UIViewController()

        let viewModel = ProfileViewModel()
        let profileController = ProfileViewController(viewModel: viewModel)

        let myMoneyNavigation = NavBarController(rootViewController: myMoneyController)
        let budgetNavigation = NavBarController(rootViewController: budgetController)
        let lentaNavigation = NavBarController(rootViewController: lentaController)
        let coursesNavigation = NavBarController(rootViewController: coursesController)
        let profileNavigation = NavBarController (rootViewController: profileController)

        myMoneyNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.myMoney,
                                                    image: Resources.Images.TabBar.myMoney,
                                                    tag: Tabs.myMoney.rawValue)
        budgetNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.budget,
                                                    image: Resources.Images.TabBar.budget,
                                                    tag: Tabs.budget.rawValue)
        lentaNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.lenta,
                                                    image: Resources.Images.TabBar.lenta,
                                                    tag: Tabs.lenta.rawValue)
        coursesNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.courses,
                                                    image: Resources.Images.TabBar.courses,
                                                    tag: Tabs.courses.rawValue)
        profileNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.profile,
                                                    image: Resources.Images.TabBar.profile,
                                                    tag: Tabs.profile.rawValue)

        setViewControllers([
            myMoneyNavigation,
            budgetNavigation,
            lentaNavigation,
            coursesNavigation,
            profileNavigation
        ], animated: false)
    }
}
