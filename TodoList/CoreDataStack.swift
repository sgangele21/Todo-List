//
//  Core Data Stack.swift
//  TodoList
//
//  Created by Sahil Gangele on 1/4/18.
//  Copyright © 2018 Sahil Gangele. All rights reserved.
//

import UIKit
import CoreData

class CoreDataStack {
// This is the underlying code
//    private(set) lazy var applicationDocumentDirectory: URL = {
//        // Looks for users home directory inside this app
//        // This array has items in the userdomain first, and items in the system domain last
//        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//
//        // Let's get the last element
//        return urls.last!
//
//    }()
//
//    private(set) lazy var managedObjectModel: NSManagedObjectModel = {
//        // This describes the data that will be accessed by the Core Data Stack
//        // During the creation of stack, the NSMOM is loaded into memory as the first step of the stack
//        // Then the coordinator is initialized
//        let modelURL = Bundle.main.url(forResource: "TodoList", withExtension: "momd")!
//        return NSManagedObjectModel(contentsOf: modelURL)!
//    }()
//
//    private(set) lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
//        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
//        let url = self.applicationDocumentDirectory.appendingPathComponent("TodoList.sqlite")
//        // This adds a persistent store in the form of the sqlite database in the document directory
//        do {
//            try coordinator.addPersistentStore(ofType: StoreType, configurationName: nil, at: url, options: nil)
//        }catch(let error) {
//            print(error)
//            abort()
//        }
//        return coordinator
//    }()
//    
//    lazy var managedObjectContext: NSManagedObjectContext = {
//        let coordinator = self.persistentStoreCoordinator
//        let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
//        moc.persistentStoreCoordinator = coordinator
//        
//    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
        let container = self.persistentContainer
        return container.viewContext
    }()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        // Name needs to match our GUI file we create and the sqlite database we create
        let container = NSPersistentContainer(name: "TodoList")
        // Instruct the contianer to create the stores
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error) , \(error.userInfo)")
            }
        })
        return container
    }()
    
}


extension NSManagedObjectContext {
    func saveChanges() {
        if self.hasChanges {
            do {
                try self.save()
            }catch(let error) {
                print(error)
            }
        }
    }
}
