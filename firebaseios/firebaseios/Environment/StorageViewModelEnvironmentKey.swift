//
//  StorageViewModelEnvironmentKey.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 11/5/23.
//

import SwiftUI

struct StorageViewModelEnvironmentKey: EnvironmentKey {
    static let defaultValue: StorageViewModelProtocol = FirebaseStorageViewModel()
}

extension EnvironmentValues {
    var storageViewModel: StorageViewModelProtocol {
        get { self[StorageViewModelEnvironmentKey.self] }
        set { self[StorageViewModelEnvironmentKey.self] = newValue }
    }
}
