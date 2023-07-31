//
//  TodoListRegisterView.swift
//  TodoListApp
//
//  Created by João Alexandre Bitar on 22/07/23.
//

import SwiftUI

struct TodoListRegisterView: View {
    var body: some View {
        VStack {
            // MARK: - Header
            
            HeaderView(title: "Register",
                       subTitle: "Start organizing todos",
                       angle: -15,
                       backgroundColor: .orange)
            
            Spacer()
        }
    }
}

struct TodoListRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListRegisterView()
    }
}
