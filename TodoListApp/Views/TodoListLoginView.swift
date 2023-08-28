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
                
                VStack(spacing: 16) {
                    if !viewModel.errorMessage.isEmpty {
                        HStack {
                            Spacer()
                            Text(viewModel.errorMessage)
                                .foregroundColor(Color.red)
                        }
                    }
                    
                    TextField("E-mail", text: $viewModel.emailText)
                        .padding()
                        .background(Color.secondary.opacity(0.12))
                        .cornerRadius(10)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.passwordText)
                        .padding()
                        .background(Color.secondary.opacity(0.12))
                        .cornerRadius(10)
                    
                    ToDoListButton(title: "Log In", background: .blue, foreground: .white) {
                        viewModel.login()
                    }
                }
                .padding(.horizontal, 20)
                .offset(y: -32)
                
                Spacer()
               
                // MARK: - Create Account
                
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: TodoListRegisterView())
                }
                
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
