//
//  CardsListHeaderViewTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 18/02/21.
//

import XCTest
import SnapshotTesting

@testable import Bootcamp_Magic

class CardsListHeaderViewTestCase: XCTestCase {

    var sut: CardsListHeaderView!
    
    override func setUp() {
        super.setUp()
        let frame = CGRect(origin: .zero,
                           size: CGSize(width: UIScreen.main.bounds.width, height: 40))
        sut = CardsListHeaderView(frame: frame)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testHeaderView() {
        sut.title = "Creature"
        sut.setupView()
        assertSnapshot(matching: sut, as: .image)
    }
    
}
