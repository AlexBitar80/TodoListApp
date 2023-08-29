//
//  TodoListViewViewModel.swift
//  TodoListApp
//
//  Created by João Alexandre Bitar on 22/07/23.
//

import Foundation

class TodoListViewViewModel: ObservableObject {
    
    @Published var showingNewItemView: Bool = false
    
    init() {
        
    }
}
