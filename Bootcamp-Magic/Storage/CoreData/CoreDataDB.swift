//
//  CoreDataDB.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 24/02/21.
//

import CoreData

enum CoreDataDBError: Error {
    case invalidEntity
    case notFoundObjects
}

final class CoreDataDB: DatabaseProtocol {
    
    private let container: CoreDataProtocol
    
    init(container: CoreDataProtocol = CoreDataContainer.default) {
        self.container = container
    }
    
    func create<Element: Storageable>(element: Element, completion: @escaping (Result<Element, Error>) -> Void) {
        guard let entity = NSEntityDescription.entity(forEntityName: Element.storageableType.rawValue,
                                                      in: container.context) else {
            completion(.failure(CoreDataDBError.invalidEntity))
            return
        }
        
        let object = NSManagedObject(entity: entity, insertInto: container.context)
        object.setValuesForKeys(element.values)
        
        container.saveContext()
        completion(.success(Element(managedObject: object)))
    }
    
    func fetch<Element: Storageable>(type: Element.Type,
                                     with predicate: NSPredicate? = nil,
                                     and sortDescriptors: [NSSortDescriptor] = [],
                                     completion: @escaping ((Result<[Element], Error>) -> Void)) {
        
        fetchManagedObjects(type: type, with: predicate, and: sortDescriptors) { result in
            switch result {
            case .success(let objects):
                completion(.success(objects.map { Element(managedObject: $0) }))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func delete<Element: Storageable>(element: Element, completion: @escaping (Error?) -> Void) {
        
        let predicate = NSPredicate(format: "id = %@", element.identifier)
        
        fetchManagedObjects(type: Element.self, with: predicate) { [weak self] (result) in
            switch result {
            case .success(let oldElements):
                guard let element = oldElements.first else {
                    completion(CoreDataDBError.notFoundObjects)
                    return
                }
                
                self?.container.context.delete(element)
                self?.container.saveContext()
                completion(nil)
                
            case .failure(let error):
                completion(error)
                return
            }
        }
    }
}

// MARK: Private methods
private extension CoreDataDB {
    
    func fetchManagedObjects<Element: Storageable>(type: Element.Type,
                                                   with predicate: NSPredicate? = nil,
                                                   and sortDescriptors: [NSSortDescriptor] = [],
                                                   completion: @escaping ((Result<[NSManagedObject], Error>) -> Void)) {
        
        let request: NSFetchRequest<NSManagedObject> = NSFetchRequest(entityName: Element.storageableType.rawValue)
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        
        let asyncRequest = NSAsynchronousFetchRequest(fetchRequest: request) { (result) in
            
            guard let objects = result.finalResult, !objects.isEmpty else {
                completion(.failure(CoreDataDBError.notFoundObjects))
                return
            }
            
            completion(.success(objects))
        }
        
        do {
            try container.context.execute(asyncRequest)
        } catch {
            completion(.failure(error))
        }
    }
}
