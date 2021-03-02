//
//  CardsListSearchViewTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 17/02/21.
//

import XCTest
import SnapshotTesting

@testable import Bootcamp_Magic

class CardsListSearchViewTestCase: XCTestCase {

    var sut: CardsListSearchView!
    
    override func setUp() {
        super.setUp()
        let frame = CGRect(origin: .zero,
                           size: CGSize(width: UIScreen.main.bounds.width, height: 40))
        sut = CardsListSearchView(frame: frame)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSearchViewDefaultState() {
        sut.placeholder = "Search"
        assertSnapshot(matching: sut, as: .image)
    }
    
}
