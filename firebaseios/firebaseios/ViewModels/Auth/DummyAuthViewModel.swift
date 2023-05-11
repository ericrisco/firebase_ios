//
//  DummyAuthViewModel.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 5/5/23.
//

import Foundation

class DummyAuthViewModel: AuthViewModelProtocol {
    var user: User
    
    required init(user: User) {
        self.user = user
    }    

    func register(onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void) {
        onSuccess(user)
    }

    func login(onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void) {
        onSuccess(user)
    }

    func isUserLoggedIn(onSuccess: @escaping (Bool) -> Void, onFailure: @escaping (Error) -> Void) {
        onSuccess(false)
    }

    func recoverPassword(onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        onSuccess()
    }

    func getUser(onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void) {
        onSuccess(user)
    }

    func logout(onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        onSuccess()
    }
}
