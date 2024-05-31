import Foundation
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

actor FirebaseAuthManager {
    static let shared = FirebaseAuthManager()

    private init() {}

    func registerUser(email: String, password: String, userName: String) async throws -> User {
        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let uid = authResult.user.uid

        let user = User(id: uid, email: email, userName: userName, avatarImageUrl: nil, password: password)
        try await FirebaseFirestoreManager.shared.saveUserToDatabase(user)
        UserDefaultsManager.shared.setStatus(true)
        syncWithUserDefaultsByUser(with: user)
        return user
    }

    func loginUser(email: String, password: String) async throws -> User {
        let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
        let uid = authResult.user.uid

        let user = try await FirebaseFirestoreManager.shared.fetchUserFromDatabase(uid: uid)
        UserDefaultsManager.shared.setStatus(true)
        syncWithUserDefaultsByUser(with: user)
        return user
    }

    private func syncWithUserDefaultsByUser(with user: User) {
        UserDefaultsManager.shared.setUserName(user.userName)
        UserDefaultsManager.shared.setUserEmail(user.email)
        UserDefaultsManager.shared.setUserPassword(user.password)

        if let id = user.id {
            UserDefaultsManager.shared.setUserId(id)
        }

        if let url = user.avatarImageUrl {
            UserDefaultsManager.shared.setUserAvatarImage(url)
        }
    }

    func isUserAuthenticated() async -> Bool {
        return Auth.auth().currentUser != nil
    }

    func logoutUser() async throws {
        try Auth.auth().signOut()
        UserDefaultsManager.shared.setStatus(false)
    }

    func getAuthenticatedUserId() async -> String? {
        return Auth.auth().currentUser?.uid
    }
}

class FirebaseFirestoreManager {
    static let shared = FirebaseFirestoreManager()
    private let db = Firestore.firestore()

    private init() {}

    func saveUserToDatabase(_ user: User) async throws {
        guard let userId = user.id else {
            throw NSError(domain: "User ID is nil", code: 0, userInfo: nil)
        }
        try await db.collection("users").document(userId).setData(from: user)
    }

    func fetchUserFromDatabase(uid: String) async throws -> User {
        let snapshot = try await db.collection("users").document(uid).getDocument()
        guard let user = try? snapshot.data(as: User.self) else {
            throw NSError(domain: "User not found", code: 0, userInfo: nil)
        }
        return user
    }
    
    func deleteUserFromDatabase(uid: String) async throws {
        try await db.collection("users").document(uid).delete()
    }

    func updateUserInDatabase(_ user: User) async throws {
        guard let userId = user.id else {
            throw NSError(domain: "User ID is nil", code: 0, userInfo: nil)
        }
        try await db.collection("users").document(userId).setData(from: user, merge: true)
    }
}
