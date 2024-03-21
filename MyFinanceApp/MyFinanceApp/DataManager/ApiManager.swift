import Foundation
import FirebaseStorage
import FirebaseFirestore

class APIManager {

    static let shared = APIManager()

    func configureFB() -> Firestore {
        var db: Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        return db
    }

    func getPost(collection: String, docName: String, completion: @escaping (User?) -> Void) {
        let db = configureFB()
        db.collection(collection).document(docName).getDocument { document, error in
            guard error == nil else { completion(nil); return }

//            let doc = Document(field1: document?.get("field1") as! String, field2: document?.get("field2") as! String)
//            completion(doc)
        }
    }

    func getImage(imageName: String, completion: @escaping (UIImage) -> Void) {
        let storage = Storage.storage()
        let reference = storage.reference()
        let pathRef = reference.child("pictures")

        var image = UIImage(named: "errorImage")

        let fileRef = pathRef.child(imageName + ".jpg")
        fileRef.getData(maxSize: 1024*1024) { data, error in
            guard error == nil else { completion(image!); return }
            image = UIImage(data: data!)!
            completion(image!)
        }

    }
}
