//
//  AddTodoView.swift
//  ubersnap-todo
//
//  Created by Paramitha on 08/08/23.
//

import CoreData
import SwiftUI

struct AddTodoView: View {
    
    @State internal var title: String = ""
    @State internal var desc: String = ""
    @State internal var dueDate: Date = Date()
    
    var body: some View {
        NavigationView {
            HStack(alignment: .top) {
                
                VStack(alignment: .leading, spacing: 16) {
                    TextField("Title", text: $title)
                        .textFieldStyle(.roundedBorder)
                    TextField("Desc", text: $desc)
                        .textFieldStyle(.roundedBorder)
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                    Button("Submit") {
                        let testData = Todo(context: CoreDataController.shared.container.viewContext)
                        testData.title = "Laundry"
                        testData.desc = "One laundry on Wednesday"
                        testData.dueDate = Date()
                        CoreDataController.shared.save()
                    }
                    Spacer()
                }
            }
            .navigationTitle("Add To-Do Item")
        }
    }
}
