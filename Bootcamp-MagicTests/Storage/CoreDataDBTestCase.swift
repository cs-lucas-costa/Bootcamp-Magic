//
//  CoreDataDBTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 24/02/21.
//

import XCTest
import CoreData

@testable import Bootcamp_Magic

class CoreDataDBTestCase: XCTestCase {

    var container: CoreDataProtocol!
    var sut: CoreDataDB!

    override func setUp() {
        super.setUp()
        container = CoreDataContainerFake()
        sut = CoreDataDB(container: container)
    }
    
    override func tearDown() {
        container = nil
        sut = nil
        super.tearDown()
    }
    
    func testCreateObject() {
        
        let card: Card = .fixture()
        let exp = expectation(description: "Create object")
        
        sut.create(element: card) { (result) in
            switch result {
            case .success(let newCard):
                XCTAssertEqual(card.id, newCard.id)
            case .failure(let error):
                XCTFail("Error - \(error)")
            }
            
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
    }

    func testFetchObjects() throws {
        
        let count = 2
        let exp = expectation(description: "Fetch objects")
        
        let cards = try createCardObjects(count: count)
        
        sut.fetch(type: Card.self) { (result) in
            switch result {
            case .success(let newCards):
                XCTAssertEqual(newCards.count, cards.count)
            case .failure(let error):
                XCTFail("Error - \(error)")
            }
            
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
    }
    
    func testDeleteObject() throws {
        
        let card = try XCTUnwrap(try createCardObjects(count: 1).first)
        let exp = expectation(description: "Delete object")
        var error: Error?
        
        sut.delete(element: card) { (result) in
            error = result
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        XCTAssertNil(error)
    }
    
    func testNotFoundObjectWhenDelete() throws {
        
        let card = Card.fixture()
        let exp = expectation(description: "Not found object to delete")
        var error: Error?
        
        sut.delete(element: card) { (result) in
            error = result
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        XCTAssertEqual((error as? CoreDataDBError), .notFoundObjects)
    }

}

// MARK: AuxiliaryMethods
extension CoreDataDBTestCase {
    
    func createCardObjects(count: Int) throws -> [Card] {
        
        var cards: [Card] = []
        
        for _ in 0..<count {
            let entity = try XCTUnwrap(NSEntityDescription.entity(forEntityName: StorageableTypes.card.rawValue,
                                                    in: container.context))
            let object = NSManagedObject(entity: entity, insertInto: container.context)
            object.setValuesForKeys(Card.fixture().values)
            cards.append(Card(managedObject: object))
            container.saveContext()
        }
        
        return cards
    }
    
}
