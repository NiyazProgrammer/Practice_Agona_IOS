import Foundation
import CoreData

class UserService {
    private let context = CoreDataManager.shared.viewContext

    func addUser(id: UUID, name: String, email: String) {
//        let user = User(context: context)
//        user.id = id
//        user.name = name
//        user.email = email
//
//        saveContext()
    }

    func fetchUsers() -> [User] {
//        let request: NSFetchRequest<User> = User.fetchRequest()
//
//        do {
//            return try context.fetch(request)
//        } catch {
//            print("Failed to fetch users: \(error)")
//            return []
//        }
        return []
    }

    func fetchUserById(_ id: UUID) -> User? {
//        let request: NSFetchRequest<User> = User.fetchRequest()
//        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
//
//        do {
//            return try context.fetch(request).first
//        } catch {
//            print("Failed to fetch user by id: \(error)")
//            return nil
//        }
        return nil
    }

    func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}
