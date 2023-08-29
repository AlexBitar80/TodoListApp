//
//  TodoListNewItemViewViewModel.swift
//  TodoListApp
//
//  Created by João Alexandre Bitar on 22/07/23.
//

import Foundation

class TodoListNewItemViewViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var dueDate: Date = Date()
    @Published var showAlert: Bool = false
    
    init() {
        
    }
    
    // MARK: - Helpers
    
    func save() {}
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
