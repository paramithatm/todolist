//
//  ubersnap_todoApp.swift
//  ubersnap-todo
//
//  Created by Paramitha on 08/08/23.
//

import CoreData
import SwiftUI

@main
struct ubersnap_todoApp: App {

    var body: some Scene {
        WindowGroup {
            AddTodoView()
            ContentView()
                .environment(\.managedObjectContext, CoreDataController.shared.container.viewContext)

        }
    }
}
