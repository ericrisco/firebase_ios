//
//  StorageViewModelProtocol.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 6/5/23.
//

import SwiftUI

protocol StorageViewModelProtocol {
    func uploadImage(image: UIImage, onSuccess: @escaping (String) -> Void, onFailure: @escaping (Error) -> Void)
}
