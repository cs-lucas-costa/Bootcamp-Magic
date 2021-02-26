//
//  ExpansionCoordinatorTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 25/02/21.
//

import XCTest

@testable import Bootcamp_Magic

class ExpansionCoordinatorTestCase: XCTestCase {

    var sut: ExpansionCoordinator!
    
    override func setUp() {
        super.setUp()
        let network = NetworkManager(service: NetworkServiceStub(bundle: Bundle(for: type(of: self))))
        let databaseManager = CoreDataDB(container: CoreDataContainerFake())
        
        sut = ExpansionCoordinator(navigationController: UINavigationController.dummy,
                                   networkManager: network, dataBaseManager: databaseManager)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testStartCoordinator() {
        
        sut.start()
        
        XCTAssertTrue(sut.currentViewController is ExpansionViewController)
        XCTAssertTrue(sut.navigationController.visibleViewController is ExpansionViewController)
    }

}
