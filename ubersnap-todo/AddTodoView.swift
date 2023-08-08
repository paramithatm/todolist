//
//  AddTodoView.swift
//  ubersnap-todo
//
//  Created by Paramitha on 08/08/23.
//

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
                }
            }
            .navigationTitle("Add To-Do Item")
        }
    }
}