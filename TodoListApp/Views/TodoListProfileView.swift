//
//  TodoListProfileView.swift
//  TodoListApp
//
//  Created by João Alexandre Bitar on 22/07/23.
//

import SwiftUI

struct TodoListProfileView: View {
    
    @StateObject var viewModel = TodoListProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading user...")
                }
                
                Spacer()
                
                ToDoListButton(title: "Log Out",
                               background: .red,
                               foreground: .white) {
                    viewModel.logOut()
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
           
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 120, height: 120)
            .padding()
        
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                
                Text("\(user.name)")
            }
            .padding()
            
            HStack {
                Text("Email: ")
                    .bold()
                
                Text("\(user.email)")
            }
            .padding()
            
            HStack {
                Text("Member since: ")
                    .bold()
                
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
    }
}

struct TodoListProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListProfileView()
    }
}
