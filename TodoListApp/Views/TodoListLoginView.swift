//
//  TodoListLoginView.swift
//  TodoListApp
//
//  Created by João Alexandre Bitar on 22/07/23.
//

import SwiftUI

struct TodoListLoginView: View {
    
    @StateObject var viewModel = TodoListLoginViewViewModel()
    @State private var isKeyboardVisible = false
    @State private var headerHeight: CGFloat = 300
    
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
                .frame(height: headerHeight)
                
                // MARK: - Login Form
                
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("E-mail", text: $viewModel.emailText)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.passwordText)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    ToDoListButton(title: "Log In", background: .blue, foreground: .white) {
                        viewModel.login()
                    }
                }
                .offset(y: -50)
                .padding(.vertical, -40)
                .onAppear {
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
                        self.keyboardWillShow(notification: notification)
                    }
                    
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { notification in
                        self.keyboardWillHide(notification: notification)
                    }
                }
                .onDisappear {
                    NotificationCenter.default.removeObserver(self)
                }
               
                // MARK: - Create Account
                
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: TodoListRegisterView())
                }
                .opacity(isKeyboardVisible ? 0 : 1)
            }
        }
    }
    
    private func keyboardWillShow(notification: Notification) {
        isKeyboardVisible = true
        headerHeight = 280
    }
    
    private func keyboardWillHide(notification: Notification) {
        isKeyboardVisible = false
        headerHeight = 300
    }
}

struct TodoListLoginView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListLoginView()
    }
}
