//
//  User.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 5/5/23.
//

import Foundation

class User {
    let id: String
    let email: String
    let password: String
    
    init(id: String, email: String, password: String) {
        self.id = id
        self.email = email
        self.password = password
    }
    
    convenience init() {
        self.init(id: "", email: "", password: "")
    }
}
