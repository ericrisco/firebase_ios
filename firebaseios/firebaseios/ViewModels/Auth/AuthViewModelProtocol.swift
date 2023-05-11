//
//  AuthViewModelInterface.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 5/5/23.
//

import Foundation

protocol AuthViewModelProtocol {
    var user: User { get set }
    
    init(user: User)

    func register(onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void)
    func login(onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void)
    func isUserLoggedIn(onSuccess: @escaping (Bool) -> Void, onFailure: @escaping (Error) -> Void)
    func recoverPassword(onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void)
    func getUser(onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void)
    func logout(onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void)
}
