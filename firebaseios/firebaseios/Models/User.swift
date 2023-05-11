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
    
    init(id: String, email: String) {
        self.id = id
        self.email = email
    }
    
    convenience init() {
        self.init(id: "", email: "")
    }
}
