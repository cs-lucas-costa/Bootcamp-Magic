//
//  CardDetailToggleButtonTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by pedro.silveira on 24/02/21.
//

import XCTest
import SnapshotTesting

@testable import Bootcamp_Magic

class CardDetailToggleButtonTestCase: XCTestCase {

    var sut: CardDetailToggleButton!
    
    override func setUp() {
        super.setUp()
        
        sut = CardDetailToggleButton()
//        isRecording = true
    }

    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    func testToggle() {
        
        sut.toggleIsFavorite()
        
        let backgroundColor = sut.backgroundColor
        let baseColor: UIColor = .red
        
        XCTAssertEqual(backgroundColor, baseColor)
    }

    func testCardsListWithCards() {
        
        assertSnapshot(matching: sut, as: .image)
    }
    
}
