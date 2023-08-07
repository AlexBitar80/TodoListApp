//
//  User.swift
//  TodoListApp
//
//  Created by João Alexandre Bitar on 22/07/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
