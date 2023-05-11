//
//  DummyStorageViewModel.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 6/5/23.
//

import SwiftUI

class DummyStorageViewModel: StorageViewModelProtocol {
    func uploadImage(image: UIImage, onSuccess: @escaping (String) -> Void, onFailure: @escaping (Error) -> Void) {
        let dummyImageUrl = "https://example.com/dummy-image-url"
        onSuccess(dummyImageUrl)
    }
}
