//
//  LogViewModelProtocol.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 5/5/23.
//

protocol LogViewModelProtocol {
    func log(screen: String, action: String)
    func crash(screen: String, exception: Error)
}
