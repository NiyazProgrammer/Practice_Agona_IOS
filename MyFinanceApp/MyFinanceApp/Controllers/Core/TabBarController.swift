import UIKit
import SwiftUI

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
        UserDataManager.shared.setupCurrentUser()
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {

        tabBar.tintColor = Resources.Colors.active
        tabBar.barTintColor = .white
        tabBar.backgroundColor = .white

        let homeController = HomeViewController()
        homeController.navigationItem.largeTitleDisplayMode = .always

        let lentaController = LentaViewController()
        let coursesController = CoursesViewController()

        let myBudgetViewModel = MyBudgetViewModel(repository: BankCardRepositoryImpl(localService: LocalBankCardService(), remoteService: RemoteBankCardService()))
        let budgetController = UIHostingController(rootView: MyBudgetView(model: myBudgetViewModel))
//        let budgetController = UIHostingController(rootView: MyBudgetView())
        let profileViewModel = ProfileViewModel(usersData: UserDataManager.shared)
        let profileController = ProfileViewController(viewModel: profileViewModel)

        let homeNavigation = NavBarController(rootViewController: homeController)
        homeNavigation.navigationBar.prefersLargeTitles = true
        let budgetNavigation = NavBarController(rootViewController: budgetController)
        let lentaNavigation = NavBarController(rootViewController: lentaController)
        let coursesNavigation = NavBarController(rootViewController: coursesController)
        let profileNavigation = NavBarController(rootViewController: profileController)

        homeNavigation.tabBarItem = UITabBarItem(
            title: Resources.Strings.TabBar.myMoney,
            image: Resources.Images.TabBar.home,
            tag: Tabs.myMoney.rawValue)
        budgetNavigation.tabBarItem = UITabBarItem(
            title: Resources.Strings.TabBar.budget,
            image: Resources.Images.TabBar.budget,
            tag: Tabs.budget.rawValue)
        lentaNavigation.tabBarItem = UITabBarItem(
            title: Resources.Strings.TabBar.lenta,
            image: Resources.Images.TabBar.lenta,
            tag: Tabs.lenta.rawValue)
        coursesNavigation.tabBarItem = UITabBarItem(
            title: Resources.Strings.TabBar.courses,
            image: Resources.Images.TabBar.courses,
            tag: Tabs.courses.rawValue)
        profileNavigation.tabBarItem = UITabBarItem(
            title: Resources.Strings.TabBar.profile,
            image: Resources.Images.TabBar.profile,
            tag: Tabs.profile.rawValue)

        setViewControllers([
            homeNavigation,
            budgetNavigation,
            lentaNavigation,
            coursesNavigation,
            profileNavigation
        ], animated: false)
    }
}
