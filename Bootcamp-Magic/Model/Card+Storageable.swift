//
//  Card+Storageable.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 24/02/21.
//

import CoreData

extension Card: Storageable {
    
    var identifier: String {
        id
    }
    
    var values: [String : Any] {
        [
            "id": identifier,
            "name": name,
            "imageUrl": imageUrl ?? "",
            "type": type
        ]
    }
    
    static var storageableType: StorageableTypes {
        .card
    }
    
    init(managedObject: NSManagedObject) {
        name = managedObject.value(forKey: "name") as? String ?? ""
        type = managedObject.value(forKey: "type") as? String ?? ""
        id = managedObject.value(forKey: "id") as? String ?? UUID().uuidString
        imageUrl = managedObject.value(forKey: "imageUrl") as? String
    }
}
