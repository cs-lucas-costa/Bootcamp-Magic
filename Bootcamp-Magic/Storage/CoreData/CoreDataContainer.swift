//
//  CoreDataContainer.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 24/02/21.
//

import CoreData

final class CoreDataContainer: CoreDataProtocol {
    
    static let `default` = CoreDataContainer()
    let containerIdentifier: String = "BootcampMagic"
    
    private init() {}
    
    private lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: containerIdentifier)
        
        guard container.persistentStoreDescriptions.first != nil else {
            fatalError("Couldn't retrieve persistent store description")
        }
        
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
