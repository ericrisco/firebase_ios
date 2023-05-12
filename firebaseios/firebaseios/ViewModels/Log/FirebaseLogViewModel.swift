//
//  FirebaseLogViewModel.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 12/5/23.
//

import Firebase

class FirebaseLogViewModel: LogViewModelProtocol {
    func log(screen: String, action: String) {
        Analytics.logEvent(action, parameters: [
            AnalyticsParameterScreenName: screen
        ])
    }
    
    func crash(screen: String, exception: Error) {
        
    }
}
