//
//  TodoListRegisterView.swift
//  TodoListApp
//
//  Created by João Alexandre Bitar on 22/07/23.
//

import SwiftUI

struct TodoListRegisterView: View {
    
    @State var fullName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
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
                TextField("Full Name", text: $fullName)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("E-mail", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                ToDoListButton(title: "Register Now", background: .green, foreground: .white) {
                    print("Registring...")
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
