//
//  FirebaseStorageViewModel.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 14/5/23.
//

import SwiftUI
import FirebaseStorage

class FirebaseStorageViewModel: StorageViewModelProtocol {
    func uploadImage(image: UIImage, onSuccess: @escaping (String) -> Void, onFailure: @escaping (Error) -> Void) {
        
        guard let imageData = image.pngData() else {
            onFailure(NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unable to convert image to Data."]))
            return
        }

        let storage = Storage.storage()
        let storageRef = storage.reference()

        let imageName = "\(UUID().uuidString).png"
        let imageRef = storageRef.child(imageName)

        let uploadTask = imageRef.putData(imageData, metadata: nil) { (metadata, error) in
            if let error = error {
                onFailure(error)
            } else {
                imageRef.downloadURL { (url, error) in
                    if let error = error {
                        onFailure(error)
                    } else if let url = url {
                        onSuccess(url.absoluteString)
                    }
                }
            }
        }
    }
}

