//
//  CoreDataContainerFake.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 24/02/21.
//

import CoreData

@testable import Bootcamp_Magic

final class CoreDataContainerFake: CoreDataProtocol {
    
    let containerIdentifier: String = "BootcampMagic"
    
    private lazy var container: NSPersistentContainer = {
        
        let storeDescription = NSPersistentStoreDescription()
        storeDescription.type = NSInMemoryStoreType
        
        let container = NSPersistentContainer(name: containerIdentifier)
        container.persistentStoreDescriptions = [storeDescription]
        
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Unresolved error \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        container.viewContext
    }
}
