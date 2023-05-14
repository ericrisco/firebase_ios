//
//  FirebaseAuthViewModel.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 14/5/23.
//

import Foundation
import FirebaseAuth

class FirebaseAuthViewModel: AuthViewModelProtocol {
    
    func register(email: String, password: String, onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                onFailure(error)
            } else if let authResult = result {
                let id = authResult.user.uid
                onSuccess(User(id: id, email: email, password: ""))
            }
        }
    }
    
    func login(email: String, password: String, onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                onFailure(error)
            } else if let authResult = result {
                let id = authResult.user.uid
                onSuccess(User(id: id, email: email, password: ""))
            }
        }
    }
    
    func isUserLoggedIn(onSuccess: @escaping (Bool) -> Void, onFailure: @escaping (Error) -> Void) {
        if let _ = Auth.auth().currentUser {
            onSuccess(true)
        } else {
            onFailure(NSError(domain: "", code: -1, userInfo: nil))
        }
    }
    
    func recoverPassword(email: String, onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                onFailure(error)
            } else {
                onSuccess()
            }
        }
    }
    
    func getUser(onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void) {
        if let user = Auth.auth().currentUser {
            let id = user.uid
            let email = user.email
            onSuccess(User(id: id, email: email ?? "", password: ""))
        } else {
            onFailure(NSError(domain: "", code: -1, userInfo: nil))
        }
    }
    
    func logout(onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        do {
            try Auth.auth().signOut()
            onSuccess()
        } catch let signOutError {
            onFailure(signOutError)
        }
    }
    
    
}
