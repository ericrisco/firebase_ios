//
//  ContentView.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 5/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        if isLoggedIn {
            WallScreen(isLoggedIn: $isLoggedIn)
        } else {
            LoginView(isLoggedIn: $isLoggedIn)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
