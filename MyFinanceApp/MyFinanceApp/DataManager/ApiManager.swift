import Foundation
import FirebaseStorage
import FirebaseFirestore
import Kingfisher

enum SetImageAvatarUserError: Error {
    case setImageError
}
class APIManager {

    static let shared = APIManager()

    private init() { }

    private func configureFB() -> Firestore {
        var dataBase: Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        dataBase = Firestore.firestore()
        return dataBase
    }

    func getUser(collection: String, docName: String, completion: @escaping (User?) -> Void) {
        let dataBase = configureFB()
        dataBase.collection(collection).document(docName).getDocument { document, error in
            guard error == nil else { completion(nil); return }

            let user = User(
                email: document?.get("email") as? String,
                firstName: document?.get("firstName") as? String,
                lastName: document?.get("lastName") as? String,
                middleName: document?.get("middleName") as? String,
                userName: document?.get("nickName") as? String)
            completion(user)
        }
    }

    func getImage(imageName: String, completion: @escaping (UIImage) -> Void) {
        let storage = Storage.storage()
        let reference = storage.reference()
        let pathRef = reference.child("UsersImage")

        let image = UIImage(named: "errorImage")

        let fileRef = pathRef.child(imageName + ".png")
        fileRef.downloadURL { url, error in
            guard let url = url, error == nil else {
                completion(image ?? UIImage())
                return
            }
            KingfisherManager.shared.retrieveImage(with: url) { result in
                switch result {
                case .success(let imageResult):
                    let loadedImage = imageResult.image
                    completion(loadedImage)
                case .failure(let error):
                    print("Failed to load image: \(error)")
                }
            }
        }
    }

    func setImageAvatar(imageData: Data) {
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let pathRef = storageRef.child("UsersImage/file.png")

        pathRef.putData(imageData) { _, error in
            guard error == nil else {
                print("Erorr upload image: \(String(describing: error))")
                return
            }
        }
    }
}
