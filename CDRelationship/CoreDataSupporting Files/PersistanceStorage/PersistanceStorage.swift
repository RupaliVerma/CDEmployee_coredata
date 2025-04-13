//
//  PersistantStorage.swift
//  CDRelationship
//
//  Created by RUPALI VERMA on 02/07/24.
//

import Foundation
import CoreData

final class PersistantStorage{
    
    // MARK: - Core Data stack
    
    private init(){}
    static var shared = PersistantStorage()

    lazy var persistentContainer: NSPersistentContainer = {
      
        let container = NSPersistentContainer(name: "CDRelationship")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    
    lazy var context = persistentContainer.viewContext

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    func fetchManagerObjects<T:NSManagedObject>(managedObject:T.Type) -> [T]?{
        do {
           guard
            let results = try PersistantStorage.shared.context.fetch(managedObject.fetchRequest()) as? [T] else{ return nil }
            return results
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
}
