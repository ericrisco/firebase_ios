//
//  Tweet.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 6/5/23.
//

class Tweet: Identifiable {
    let id: String
    let userName: String
    let type: TweetType
    let message: String
    let timestamp: String
    
    init() {
        self.id = ""
        self.userName = ""
        self.type = .TEXT
        self.message = ""
        self.timestamp = ""
    }
    
    init(id: String, userName: String, type: TweetType, message: String, timestamp: String) {
        self.id = id
        self.userName = userName
        self.type = type
        self.message = message
        self.timestamp = timestamp
    }
}
