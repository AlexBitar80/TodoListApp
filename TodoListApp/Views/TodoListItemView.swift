//
//  TodoListItemView.swift
//  TodoListApp
//
//  Created by João Alexandre Bitar on 22/07/23.
//

import SwiftUI

struct TodoListItemView: View {
    
    @StateObject var viewModel = TodoListItemViewViewModel()
    
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .foregroundColor(Color(.secondaryLabel))
                    .font(.footnote)
            }
            
            Spacer()
            
            Button {
                viewModel.toogleIsDone(item: item)
            
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(item.isDone ? Color(.systemGreen) : Color(.systemGray))
                    .font(.title2)
            }
        }
    }
}

struct TodoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListItemView(item: ToDoListItem(id: "123",
                                            title: "Hello",
                                            dueDate: Date().timeIntervalSince1970,
                                            createdDate: Date().timeIntervalSince1970,
                                            isDone: true))
    }
}
