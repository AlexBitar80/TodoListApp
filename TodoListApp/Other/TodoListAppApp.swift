//
//  TodoListAppApp.swift
//  TodoListApp
//
//  Created by João Alexandre Bitar on 22/07/23.
//

import FirebaseCore
import SwiftUI

@main
struct TodoListAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
