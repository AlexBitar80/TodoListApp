//
//  TodoListRegisterView.swift
//  TodoListApp
//
//  Created by João Alexandre Bitar on 22/07/23.
//

import SwiftUI

struct TodoListRegisterView: View {
    
    @StateObject var viewModel = TodoListRegisterViewViewModel()
    
    var body: some View {
        VStack {
            // MARK: - Header
            
            HeaderView(title: "Register",
                       subTitle: "Start organizing todos",
                       angle: -15,
                       backgroundColor: .orange)
            
            VStack(spacing: 16) {
                
                TextField("Full Name", text: $viewModel.fullName)
                    .padding()
                    .background(Color.secondary.opacity(0.12))
                    .cornerRadius(10)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                
                TextField("E-mail", text: $viewModel.email)
                    .padding()
                    .background(Color.secondary.opacity(0.12))
                    .cornerRadius(10)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .background(Color.secondary.opacity(0.12))
                    .cornerRadius(10)
                
                Spacer()
                
                ToDoListButton(title: "Register Now", background: .green, foreground: .white) {
                    viewModel.register()
                }
            }
            .padding(.horizontal, 20)
            .offset(y: -90)
            
            Spacer()
        }
    }
}

struct TodoListRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListRegisterView()
    }
}
