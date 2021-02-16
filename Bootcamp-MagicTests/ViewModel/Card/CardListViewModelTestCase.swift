//
//  CardListViewModelTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 16/02/21.
//

import XCTest

@testable import Bootcamp_Magic

class CardListViewModelTestCase: XCTestCase {

    var sut: CardListViewModel!
    var networkManager: NetworkManager!
    var serviceStub: NetworkServiceStub!
    
    override func setUp() {
        super.setUp()
        let bundle = Bundle(for: type(of: self))
        serviceStub = NetworkServiceStub(bundle: bundle)
        serviceStub.json = bundle.url(forResource: "cards", withExtension: "json")
        networkManager = NetworkManager(service: serviceStub)
        sut = CardListViewModel(networkManager: networkManager)
    }
    
    override func tearDown() {
        sut = nil
        networkManager = nil
        serviceStub = nil
        super.tearDown()
    }

    func testFetchCards() {
        
        let exp = expectation(description: "Fetch cards")
        var error: Error?
        
        sut.fetchCards(setCode: "") { (responseError) in
            error = responseError
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        
        XCTAssertNil(error)
        XCTAssertEqual(sut.dictCards.map({ $0.key }).count, 2)
        XCTAssertEqual(sut.dictCards.flatMap({ $0.value }).count, 3)
    }
    
    func testFetchCardsWithError() {
        
        let exp = expectation(description: "Fetch cards with error")
        var error: Error?
        
        serviceStub.shouldFail = true
        serviceStub.statusCode = 404
        
        sut.fetchCards(setCode: "") { (responseError) in
            error = responseError
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        
        XCTAssertNotNil(error)
    }
    
    func testSeparateCardsWithTypeSorted() {
        
        let types = ["Creature — Horror", "Enchantment"]
        let exp = expectation(description: "Fetch cards")
        var error: Error?
        
        sut.fetchCards(setCode: "") { (responseError) in
            error = responseError
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        
        XCTAssertNil(error)
        XCTAssertEqual(sut.dictCards.map({ $0.key }), types)
    }
    
    
}
