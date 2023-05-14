//
//  TweetsViewModelEnvironmentKey.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 6/5/23.
//

import SwiftUI

struct TweetsViewModelEnvironmentKey: EnvironmentKey {
    static let defaultValue: TweetsViewModelProtocol = FirebaseTweetsViewModel()
}

extension EnvironmentValues {
    var tweetsViewModel: TweetsViewModelProtocol {
        get { self[TweetsViewModelEnvironmentKey.self] }
        set { self[TweetsViewModelEnvironmentKey.self] = newValue }
    }
}
