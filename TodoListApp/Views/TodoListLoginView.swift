//
//  TodoListLoginView.swift
//  TodoListApp
//
//  Created by João Alexandre Bitar on 22/07/23.
//

import SwiftUI

struct TodoListLoginView: View {
    
    @State var emailText: String = ""
    @State var passwordText: String = ""
    
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
                    TextField("E-mail", text: $emailText)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .keyboardType(.emailAddress)
                    TextField("Password", text: $passwordText)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    Button {
                        // - Action
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue)
                            
                            Text("Log In")
                                .foregroundColor(Color.white)
                                .bold()
                        }
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
