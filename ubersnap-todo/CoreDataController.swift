//
//  CoreDataController.swift
//  ubersnap-todo
//
//  Created by Paramitha on 09/08/23.
//

import CoreData
import Foundation

struct CoreDataController {
    // A singleton for our entire app to use
    static let shared = CoreDataController()

    // Storage for Core Data
    let container: NSPersistentContainer

    // A test configuration for SwiftUI previews
    static var preview: CoreDataController = {
        let controller = CoreDataController()

        // Create 10 example programming languages.
        for _ in 0..<5 {
            let testData = Todo(context: controller.container.viewContext)
            testData.title = "Laundry"
            testData.desc = "One laundry on Wednesday"
            testData.dueDate = Date()
        }

        return controller
    }()

    // An initializer to load Core Data
    init() {
        // If you didn't name your model Main you'll need
        // to change this name below.
        container = NSPersistentContainer(name: "ubsersnap-todo")

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
