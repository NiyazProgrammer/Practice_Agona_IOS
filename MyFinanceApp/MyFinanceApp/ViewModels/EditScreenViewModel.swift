import Foundation
import Combine

class EditScreenViewModel {
    @Published var currentUser: User?
    var usersData: UserDataService?

    init(usersData: UserDataService) {
        self.usersData = usersData
        setupBinding()
    }

    func setupBinding() {
        usersData?.observerCurrentUser = { [weak self] updateUser in
            self?.currentUser = updateUser
        }
    }

    func setCurrentUser() {
        currentUser = usersData?.getCurrentUser()
    }
}
