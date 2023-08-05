//
//  TodoListLoginView.swift
//  TodoListApp
//
//  Created by João Alexandre Bitar on 22/07/23.
//

import SwiftUI

struct TodoListLoginView: View {
    
    @StateObject var viewModel = TodoListLoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // MARK: - Header
                
                HeaderView(
                    title: "To Do List",
                    subTitle: "Get things done",
                    angle: 15,
                    backgroundColor: .pink
                )
                
                // MARK: - Login Form
                
                Form {
                    TextField("E-mail", text: $viewModel.emailText)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                    
                    TextField("Password", text: $viewModel.passwordText)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    ToDoListButton(title: "Log In", background: .blue, foreground: .white) {
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                
                // MARK: - Create Account
                
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: TodoListRegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct TodoListLoginView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListLoginView()
    }
}
