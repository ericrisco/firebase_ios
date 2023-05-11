//
//  DummyLogViewModel.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 5/5/23.
//

class DummyLogViewModel: LogViewModelProtocol {
    func log(screen: String, action: String) {
        print("Dummy log: Screen - \(screen), Action - \(action)")
    }

    func crash(screen: String, exception: Error) {
        print("Dummy crash: Screen - \(screen), Exception - \(exception.localizedDescription)")
    }
}
