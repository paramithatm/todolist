//
//  CoreDataController.swift
//  ubersnap-todo
//
//  Created by Paramitha on 09/08/23.
//

import CoreData
import Foundation

struct CoreDataController {
    static let shared = CoreDataController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "ubersnap-todo")

        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Show some error here
            }
        }
    }

    
}
