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
        SortDescriptor(\.dueDate)
    ]) var todos: FetchedResults<Todo>
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Swipe to left on the cell to delete an item")
                        .fontWeight(.ultraLight)
                    Text("Tap on the cell to update the item")
                        .fontWeight(.ultraLight)
                }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                
                List(todos) { todo in
                    NavigationLink {
                        AddTodoView(todo: todo, title: todo.title ?? "", desc: todo.desc ?? "", dueDate: todo.dueDate ?? Date())
                    } label: {
                        VStack(alignment: .leading) {
                            Text(todo.title ?? "")
                                .fontWeight(.bold)
                            Text(todo.desc ?? "")
                                .fontWeight(.regular)
                            Text(todo.dueDate?.formatted(date: .long, time: .shortened) ?? "")
                                .fontWeight(.thin)
                        }
                        .swipeActions {
                            Button("Delete") {
                                moc.delete(todo)
                                try? CoreDataController.shared.container.viewContext.save()
                            }
                            .tint(.red)
                        }
                    }
                }
                .navigationTitle("To Do List")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            AddTodoView()
                        } label: {
                            Image(systemName: "plus")
                        }
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
