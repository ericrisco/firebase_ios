//
//  LogViewModelEnvironmentKey.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 5/5/23.
//

import SwiftUI

struct LogViewModelEnvironmentKey: EnvironmentKey {
    static let defaultValue: LogViewModelProtocol = DummyLogViewModel()
}

extension EnvironmentValues {
    var logViewModel: LogViewModelProtocol {
        get { self[LogViewModelEnvironmentKey.self] }
        set { self[LogViewModelEnvironmentKey.self] = newValue }
    }
}
