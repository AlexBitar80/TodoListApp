//
//  TodoListRegisterView.swift
//  TodoListApp
//
//  Created by João Alexandre Bitar on 22/07/23.
//

import SwiftUI

struct TodoListRegisterView: View {
    
  
    @StateObject var viewModel = TodoListRegisterViewViewModel()
    @State private var isKeyboardVisible = false
    @State private var headerHeight: CGFloat = 300
    
    var body: some View {
        VStack {
            // MARK: - Header
            
            HeaderView(title: "Register",
                       subTitle: "Start organizing todos",
                       angle: -15,
                       backgroundColor: .orange)
            .frame(height: headerHeight)
            
            Form {
                TextField("Full Name", text: $viewModel.fullName)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("E-mail", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                ToDoListButton(title: "Register Now", background: .green, foreground: .white) {
                    viewModel.register()
                }
            }
            .padding(.vertical, -40)
            .offset(y: -60)
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
            
            Spacer()
        }
    }
    
    private func keyboardWillShow(notification: Notification) {
        isKeyboardVisible = true
        headerHeight = 140
    }
    
    private func keyboardWillHide(notification: Notification) {
        isKeyboardVisible = false
        headerHeight = 300
    }
}

struct TodoListRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListRegisterView()
    }
}
