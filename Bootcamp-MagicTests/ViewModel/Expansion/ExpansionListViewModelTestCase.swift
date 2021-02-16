//
//  ExpansionListViewModelTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 15/02/21.
//

import XCTest
@testable import Bootcamp_Magic

class ExpansionListViewModelTestCase: XCTestCase {

    var sut: ExpansionListViewModel!
    var networkManager: NetworkManager!
    var serviceStub: NetworkServiceStub!
    
    override func setUp() {
        super.setUp()
        let bundle = Bundle(for: type(of: self))
        serviceStub = NetworkServiceStub(bundle: bundle)
        serviceStub.json = bundle.url(forResource: "expansions", withExtension: "json")
        networkManager = NetworkManager(service: serviceStub)
        sut = ExpansionListViewModel(networkManager: networkManager)
    }
    
    override func tearDown() {
        sut = nil
        networkManager = nil
        serviceStub = nil
        super.tearDown()
    }

    func testFetchExpansions() {
        
        let exp = expectation(description: "Fetch expansion")
        var error: Error?
        
        sut.fetchExpansions { (responseError) in
            error = responseError
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        
        XCTAssertNil(error)
        XCTAssertEqual(sut.dictExpansions.map({ $0.key }).count, 2)
        XCTAssertEqual(sut.dictExpansions.flatMap({ $0.value }).count, 2)
    }
    
    func testFetchExpansionsWithError() {
        
        let exp = expectation(description: "Fetch expansions with error")
        var error: Error?
        
        serviceStub.shouldFail = true
        serviceStub.statusCode = 404
        
        sut.fetchExpansions { (responseError) in
            error = responseError
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        
        XCTAssertNotNil(error)
    }
    
    func testSeparateExpansionsWithKeysAndValuesSorted() {
        
        let names = ["Tenth Edition", "Unlimited Edition"]
        let keys = ["T", "U"]
        let exp = expectation(description: "Fetch cards")
        var error: Error?
        
        sut.fetchExpansions { (responseError) in
            error = responseError
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        
        XCTAssertNil(error)
        XCTAssertEqual(sut.dictExpansions.map({ $0.key }), keys)
        XCTAssertEqual(sut.dictExpansions.flatMap({ $0.value.map({ $0.name }) }), names)
    }
    
    

}
