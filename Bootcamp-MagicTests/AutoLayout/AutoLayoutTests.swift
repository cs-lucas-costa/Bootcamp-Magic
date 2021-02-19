//
//  AutoLayoutTests.swift
//  Bootcamp-MagicTests
//
//  Created by pedro.silveira on 19/02/21.
//

import Foundation
import XCTest
@testable import Bootcamp_Magic

final class AutoLayoutTests: XCTestCase {

    var sut: UIView!
    @AutoLayout var fakeView: UIView

    override func setUp() {
        super.setUp()
        sut = fakeView
        
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testFrameZero() {
        let view = UIView(frame: .zero)
        
        XCTAssertEqual(sut.frame, view.frame)
    }
    
    func testTranslateMask() {
        
        let translateValue = sut.translatesAutoresizingMaskIntoConstraints
        
        XCTAssertFalse(translateValue)
    }
}
