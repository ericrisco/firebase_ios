//
//  LoginView.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 5/5/23.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var isLoggedIn: Bool
    
    @Environment(\.authViewModel) private var authViewModel: AuthViewModelProtocol
    @Environment(\.logViewModel) private var logViewModel: LogViewModelProtocol

    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    private static var viewName: String = "LoginView"

    var body: some View {
        VStack(spacing: 40) {

            VStack(spacing: 20) {
                TextField("Email", text: $email)
                    .padding()
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                
                SecureField("Password", text: $password)
                    .padding()
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
            }
            
            VStack(spacing: 10) {
                 Button(action: loginUser) {
                     Text("Login")
                         .padding()
                         .frame(maxWidth: .infinity)
                         .background(Color.blue)
                         .foregroundColor(.white)
                         .cornerRadius(8)
                 }

                 Button(action: registerUser) {
                     Text("Register")
                         .padding()
                         .frame(maxWidth: .infinity)
                         .background(Color.green)
                         .foregroundColor(.white)
                         .cornerRadius(8)
                 }

                 Button(action: recoverPassword) {
                     Text("Recover Password")
                         .padding()
                         .frame(maxWidth: .infinity)
                         .background(Color.orange)
                         .foregroundColor(.white)
                         .cornerRadius(8)
                 }
                
                 Button("Crash") {
                     fatalError("Crash was triggered")
                 }
             }
             .padding(.top)
             .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"),
                      message: Text(alertMessage),
                      dismissButton: .default(Text("OK")))
             }
        }
        .padding()
        .onAppear(perform: checkIfUserIsLoggedIn)
    }
    
    private func checkIfUserIsLoggedIn() {
        authViewModel.isUserLoggedIn(
            onSuccess: { loggedIn in
                isLoggedIn = loggedIn
            },
            onFailure: { error in
                logViewModel.crash(screen: LoginView.viewName, exception: error)
            }
        )
    }
    
    private func loginUser() {
        authViewModel.login(email: email, password: password,
            onSuccess: { user in
                logViewModel.log(screen: LoginView.viewName, action: "USER_LOGGED_IN")
                isLoggedIn = true
            },
            onFailure: { error in
                logViewModel.crash(screen: LoginView.viewName, exception: error)
                alertMessage = error.localizedDescription
                showAlert = true
            }
        )
    }
        
    private func registerUser() {
        authViewModel.register(email: email, password: password,
            onSuccess: { user in
                logViewModel.log(screen: LoginView.viewName, action: "USER_REGISTERED")
                isLoggedIn = true
            },
            onFailure: { error in
                alertMessage = error.localizedDescription
                showAlert = true
            }
        )
    }

    private func recoverPassword() {
        authViewModel.recoverPassword(email: email,
            onSuccess: {
                logViewModel.log(screen: LoginView.viewName, action: "PASSWORD_RECOVERED")
                alertMessage = "Password recovery initiated"
                print(alertMessage)
                showAlert = true
            },
            onFailure: { error in
                alertMessage = error.localizedDescription
                showAlert = true
            }
        )
    }
}
