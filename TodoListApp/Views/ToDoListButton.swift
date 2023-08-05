//
//  ToDoListButton.swift
//  TodoListApp
//
//  Created by João Alexandre Bitar on 05/08/23.
//

import SwiftUI

struct ToDoListButton: View {
    
    let title: String
    let background: Color
    let foreground: Color
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(foreground)
                    .bold()
            }
        }
    }
}

struct ToDoListButton_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListButton(title: "Log In", background: .pink, foreground: .white) {
            print("Hello ToDoListButton")
        }
            .previewLayout(.sizeThatFits)
    }
}
