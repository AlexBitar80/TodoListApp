//
//  TodoListLoginViewViewModel.swift
//  TodoListApp
//
//  Created by João Alexandre Bitar on 22/07/23.
//

import Foundation

class TodoListLoginViewViewModel: ObservableObject {
    
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    
    func login() {
        print("Logging in...")
    }
}

