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
//    @StateObject private var dataController = DataController()
    let controller = CoreDataController.shared

    var body: some Scene {
        WindowGroup {
            AddTodoView()
            ContentView()
                .environment(\.managedObjectContext, controller.container.viewContext)

        }
    }
}
