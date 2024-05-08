import UIKit

class ImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private var imagePickerController: UIImagePickerController?

    func showImagePicker(
        in viewController: UIViewController) {
        imagePickerController = UIImagePickerController()
        imagePickerController?.delegate = self
        imagePickerController?.allowsEditing = false
        if let newPicker = imagePickerController {
            viewController.present(newPicker, animated: true)
        }
    }

    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            picker.dismiss(animated: true)
            guard let image = info[.originalImage] as? UIImage else {
                return
        }
            guard let imageData = image.pngData() else { return }
            APIManager.shared.setImageAvatar(imageData: imageData) { result in
                switch result {
                case .success(_):
                    UserDataManager.shared.setAvatarImageUser(image: image )
                case .failure(_):
                    break
                }
            }
    }

    internal func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

