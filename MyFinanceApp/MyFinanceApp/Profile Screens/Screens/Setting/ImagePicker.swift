import UIKit

class ImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private var imagePickerController: UIImagePickerController?
    private var completion: ((UIImage) -> Void)?

    func showImagePicker(
        in viewController: UIViewController,
        completion: @escaping ((UIImage) -> Void)) {
        self.completion = completion
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
            self.completion?(image)
            APIManager.shared.setImageAvatar(imageData: imageData)
    }

    internal func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

