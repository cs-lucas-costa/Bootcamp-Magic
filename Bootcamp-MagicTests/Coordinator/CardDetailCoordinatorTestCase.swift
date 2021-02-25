//
//  CardDetailCoordinatorTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 25/02/21.
//

import XCTest

@testable import Bootcamp_Magic

class CardDetailCoordinatorTestCase: XCTestCase {

    var sut: CardDetailCoordinator!
    var delegate: CardDetailCoordinatorDelegateSpy!
    
    override func setUp() {
        super.setUp()
        let network = NetworkManager(service: NetworkServiceStub(bundle: Bundle(for: type(of: self))))
        let viewModel = CardViewModel.fixture(networkManager: network,
                                              databaseManager: CoreDataDB(container: CoreDataContainerFake()))
        
        sut = CardDetailCoordinator(navigationController: UINavigationController.dummy,
                                    viewModel: CardDetailViewModel(expansionCards: [viewModel]))
        
        delegate = CardDetailCoordinatorDelegateSpy()
        sut.delegate = delegate
        
    }
    
    override func tearDown() {
        sut = nil
        delegate = nil
        super.tearDown()
    }
    
    func testStartCoordinator() {
        
        sut.start()
        
        XCTAssertTrue(sut.currentViewController is CardDetailViewController)
        XCTAssertTrue(sut.navigationController.presentedViewController is CardDetailViewController)
    }
    
    func testDismissView() {
        sut.dismiss()
        XCTAssertTrue(delegate.isDismissed)
    }

}
