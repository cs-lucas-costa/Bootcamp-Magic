//
//  Storegable.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 24/02/21.
//

import CoreData

enum StorageableTypes: String {
    case card = "Card"
}

protocol Storageable {
    var identifier: String { get }
    var values: [String: Any] { get }
    static var storageableType: StorageableTypes { get }
    
    init(managedObject: NSManagedObject)
}
