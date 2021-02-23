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
    
    override func setUp() {
        super.setUp()
        sut = CardsListView(frame: UIScreen.main.bounds, numberOfCardsPerRow: 3,
                            state: .all(expansion: .init(expansion: .fixture())))
        dataSource = .fixture()
    }
    
    override func tearDown() {
        sut = nil
        dataSource = nil
        super.tearDown()
    }
    
    func testCardsListWithCards() {
        sut.title = "Khans of Tarkir"
        sut.collectionView.dataSource = dataSource
        assertSnapshot(matching: sut, as: .image)
    }
    
}
