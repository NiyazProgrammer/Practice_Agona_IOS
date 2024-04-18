import Foundation

class EditScreenViewModel {
    @Published var currentUser: User?
    var usersData: UserDataService?

    init(usersData: UserDataService) {
        self.usersData = usersData
    }

    func setCurrentUser() {
        currentUser = usersData?.getCurrentUser()
    }
}
