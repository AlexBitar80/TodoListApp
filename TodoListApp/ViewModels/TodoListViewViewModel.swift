//
//  TodoListViewViewModel.swift
//  TodoListApp
//
//  Created by João Alexandre Bitar on 22/07/23.
//

import Foundation
import FirebaseFirestore

class TodoListViewViewModel: ObservableObject {
    
    @Published var showingNewItemView: Bool = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    // MARK: - Helpers
    
    func delete(id: String) {
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
