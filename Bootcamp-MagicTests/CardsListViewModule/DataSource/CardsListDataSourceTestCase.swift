//
//  CardsListDataSourceTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 17/02/21.
//

import XCTest
@testable import Bootcamp_Magic

class CardsListDataSourceTestCase: XCTestCase {
    
    var sut: CardsListDataSource!
    var service: NetworkServiceStub!
    var networkManager: NetworkManager!
    
    override func setUp() {
        super.setUp()
        let bundle = Bundle(for: type(of: self))
        service = NetworkServiceStub(bundle: bundle)
        networkManager = NetworkManager(service: service)
        sut = .fixture(networkManager: networkManager, databaseManager: CoreDataDB(container: CoreDataContainerFake()))
    }
    
    override func tearDown() {
        sut = nil
        service = nil
        networkManager = nil
        super.tearDown()
    }
    
    func testNumberOfSections() {
        let sections = sut.numberOfSections(in: .init(frame: .zero, collectionViewLayout: .init()))
        XCTAssertEqual(sections, 2)
    }
    
    func testFilterCardsWithName() {
        
        let name = "Abomination of Gudul"
        let type = "Creature — Horror"
         
        sut.filter = (true, name)
        
        let result = sut.filteredCards
        let dictCard = sut.filteredCards.first(where: { $0.key == type })
        
        XCTAssertEqual(result.count, 1)
        XCTAssertNotNil(dictCard)
        XCTAssertEqual(dictCard?.value.count, 1)
    }
    
}
