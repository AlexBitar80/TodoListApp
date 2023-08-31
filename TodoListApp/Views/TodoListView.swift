//
//  TodoListView.swift
//  TodoListApp
//
//  Created by João Alexandre Bitar on 22/07/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct TodoListView: View {
    
    @StateObject var viewModel: TodoListViewViewModel
    
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        
        self._viewModel = StateObject(wrappedValue: TodoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    TodoListItemView(item: item)
                        .swipeActions {
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                            }
                            .tint(Color.red)
                        }
                }
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                TodoListNewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(userId: "qF8zphyAJzP3yKeqwqMMCdfcsqw1")
    }
}
