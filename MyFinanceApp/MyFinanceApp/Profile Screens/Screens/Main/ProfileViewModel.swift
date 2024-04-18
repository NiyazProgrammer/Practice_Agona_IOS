import Foundation
import Combine

class ProfileViewModel {
    @Published var currentUser: User?
    var usersData: UserDataService?

    init(usersData: UserDataService) {
        self.usersData = usersData
    }

    func setUser() {
        currentUser = usersData?.getCurrentUser()
    }
}
