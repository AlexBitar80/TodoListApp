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
    
    var body: some View {
        VStack {
            // MARK: - Header
            
            HeaderView(title: "Register",
                       subTitle: "Start organizing todos",
                       angle: -15,
                       backgroundColor: .orange)
            
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
                .padding()
            }
            .offset(y: -50)
            
            Spacer()
        }
    }
}

struct TodoListRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListRegisterView()
    }
}
