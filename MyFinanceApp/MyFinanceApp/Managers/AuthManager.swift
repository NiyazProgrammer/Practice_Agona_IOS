import Foundation

// MARK: Здесь будет логика регистрации через Firebase
// Также будет присутствовать вся логика регистрации и входа
class AuthManager {
    static var chared = AuthManager()

    private init() { }

    var isSignedIN: Bool {
        return false
    }
}
