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
                Text("Hello World")
            }
            .navigationTitle("Profile")
        }
    }
}

struct TodoListProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListProfileView()
    }
}
