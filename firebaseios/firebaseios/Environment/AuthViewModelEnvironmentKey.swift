//
//  AuthViewModelEnvironmentKey.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 5/5/23.
//

import SwiftUI

struct AuthViewModelEnvironmentKey: EnvironmentKey {
    static let defaultValue: AuthViewModelProtocol = DummyAuthViewModel(user: User())
}

extension EnvironmentValues {
    var authViewModel: AuthViewModelProtocol {
        get { self[AuthViewModelEnvironmentKey.self] }
        set { self[AuthViewModelEnvironmentKey.self] = newValue }
    }
}
