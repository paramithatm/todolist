//
//  ContentView.swift
//  ubersnap-todo
//
//  Created by Paramitha on 08/08/23.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.dueDate, order: .reverse)
    ]) var todos: FetchedResults<Todo>
    
    var body: some View {
        NavigationView {
            List(todos) { todo in
                Text(todo.title ?? "")
                    .swipeActions {
                        Button("Delete") {
                            print("Boo")
                        }
                        .tint(.red)
                        Button("Update") {
                            print("bluuu")
                        }
                        .tint(.blue)
                    }
            }
            .navigationTitle("To Do List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add To-do") {
                        print("wolololo")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}
