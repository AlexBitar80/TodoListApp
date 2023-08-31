//
//  TodoListLoginViewViewModel.swift
//  TodoListApp
//
//  Created by João Alexandre Bitar on 22/07/23.
//

import Foundation
import FirebaseAuth

class TodoListLoginViewViewModel: ObservableObject {
    
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    @Published var errorMessage: String = ""
    
    func login() {
        guard validate() else { return }
        
        Auth.auth().signIn(withEmail: emailText, password: passwordText)
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !emailText.trimmingCharacters(in: .whitespaces).isEmpty,
              !passwordText.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "please fill in all fields"
            return false
        }
        
        guard emailText.contains("@") && emailText.contains(".") else {
            errorMessage = "please enter a valid e-mail."
            return false
        }
        
        return true
    }
}

