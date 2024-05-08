import Foundation
import UIKit
import Combine

protocol UserDataService {
    func getCurrentUser() -> User
    func setupCurrentUser()
    func setAvatarImageUserWithDB()
    var observerCurrentUser: ((User) -> Void)? { get set }
}
class UserDataManager: UserDataService {
    private var currentUser: User?
    var observerCurrentUser: ((User) -> Void)?

    static var shared: UserDataManager = .init()
    private init() {
        // MARK: здесь выполняем запрос в сеть, достаем текущего пользователя
        // через userDefaults & swiftGen
    }

    func getCurrentUser() -> User {
        return currentUser ?? User()
    }

    func setupCurrentUser() {
        APIManager.shared.getUser(collection: "users", docName: "n3iO6uZq7WQN9m4a3R9m") { [weak self] user in
            if let newUser = user {
                self?.currentUser = newUser
                self?.setAvatarImageUserWithDB()
            }
        }
    }

    func setAvatarImageUserWithDB() {
        APIManager.shared.getImage(imageName: "file") { [weak self] image in
            self?.currentUser?.avatarImage = image
            if let observer = self?.observerCurrentUser {
                observer(self?.currentUser ?? User())
            }
        }
    }

    func setAvatarImageUser(image: UIImage) {
        currentUser?.avatarImage = image
    }
}
