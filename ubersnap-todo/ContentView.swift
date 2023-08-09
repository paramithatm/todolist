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
        SortDescriptor(\.dueDate, order: .reverse)
    ]) var todos: FetchedResults<Todo>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todos) { todo in
                    Text(todo.title ?? "")
//                        .swipeActions {
////                            Button("Delete") {
////                                print("Boo")
////                            }
////                            .tint(.red)
//                            Button("Update") {
//                                print("bluuu")
//                            }
//                            .tint(.blue)
//                        }
                }.onDelete(perform: removeTodo)
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
    
    func removeTodo(at offsets: IndexSet) {
        for index in offsets {
            let todo = todos[index]
            moc.delete(todo)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}
