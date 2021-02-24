//
//  CoreDataProtocol.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 24/02/21.
//

import CoreData

protocol CoreDataProtocol {
    var context: NSManagedObjectContext { get }
    var containerIdentifier: String { get }
    func saveContext()
}

extension CoreDataProtocol {
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("Unresolved error \(error.localizedDescription)")
            }
        }
    }
}
