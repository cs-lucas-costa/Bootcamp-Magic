//
//  CardsListViewTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 17/02/21.
//

import XCTest
import SnapshotTesting

@testable import Bootcamp_Magic

class CardsListViewTestCase: XCTestCase {

    var sut: CardsListView!
    var dataSource: CardsListDataSource!
    var service: NetworkServiceStub!
    var networkManager: NetworkManager!
    
    override func setUp() {
        super.setUp()
        
        let bundle = Bundle(for: type(of: self))
        service = NetworkServiceStub(bundle: bundle)
        networkManager = NetworkManager(service: service)
        sut = CardsListView(frame: UIScreen.main.bounds, numberOfCardsPerRow: 3,
                            state: .all(expansion: .init(expansion: .fixture())))
        dataSource = .fixture(networkManager: networkManager)
//        isRecording = true
    }
    
    override func tearDown() {
        sut = nil
        dataSource = nil
        service = nil
        networkManager = nil
        super.tearDown()
    }
    
    // TODO
    
//    func testCardsListWithCards() {
//        sut.title = "Khans of Tarkir"
//        sut.collectionView.dataSource = dataSource
//        assertSnapshot(matching: sut, as: .image)
//    }
    
}
