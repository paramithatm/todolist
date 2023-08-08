//
//  ContentView.swift
//  ubersnap-todo
//
//  Created by Paramitha on 08/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Text("asdkljasd")
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
                Text("asdkljasd")
                Text("asdkljasd")
                Text("asdkljasd")
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
