//
//  AddTodoView.swift
//  ubersnap-todo
//
//  Created by Paramitha on 08/08/23.
//

import CoreData
import SwiftUI

struct AddTodoView: View {
    
    @State internal var todo: Todo? = nil
    @State internal var title: String = ""
    @State internal var desc: String = ""
    @State internal var dueDate: Date = Date()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            HStack(alignment: .top) {
                VStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 16) {
                        TextField("Title", text: $title)
                            .textFieldStyle(.roundedBorder)
                        TextField("Desc", text: $desc)
                            .textFieldStyle(.roundedBorder)
                        DatePicker("Due Date", selection: $dueDate)
                        
                    }.padding(EdgeInsets(top: 0, leading: 16, bottom: 32, trailing: 16))
                    
                    Button("Submit", action: {
                        if let todo = todo {
                            // update todo
                            todo.title = title
                            todo.desc = desc
                            todo.dueDate = dueDate
                        } else {
                            // create new todo
                            let newTodo = Todo(context: CoreDataController.shared.container.viewContext)
                            newTodo.title = title
                            newTodo.desc = desc
                            newTodo.dueDate = dueDate
                        }
                        CoreDataController.shared.save()
                        presentationMode.wrappedValue.dismiss()
                    })
                    .fontWeight(.bold)
                    Spacer()
                }
            }
            .navigationTitle("Add To-Do Item")
        }
    }
}
