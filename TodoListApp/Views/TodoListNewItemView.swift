//
//  TodoListNewItemView.swift
//  TodoListApp
//
//  Created by João Alexandre Bitar on 22/07/23.
//

import SwiftUI

struct TodoListNewItemView: View {
    
    @StateObject var viewModel = TodoListNewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        
        VStack {
            Text("New Item")
                .font(.system(size: 30))
                .bold()
                .padding(.top, 12)
            
            Form {
                TextField("Title", text: $viewModel.title)
                    .padding(10)
                    .background(Color.secondary.opacity(0.12))
                    .cornerRadius(10)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                
                // - Due Data
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // - Button
                
                ToDoListButton(title: "Create", background: .pink, foreground: .white) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Please enter a valid title and date"),
                      dismissButton: .default(Text("Ok"))
                )
            }
        }
    }
}

struct TodoListNewItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListNewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
