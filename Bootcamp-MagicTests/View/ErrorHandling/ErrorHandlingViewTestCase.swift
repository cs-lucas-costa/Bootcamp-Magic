//
//  ErrorHandlingViewTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 01/03/21.
//

import XCTest
import SnapshotTesting

@testable import Bootcamp_Magic

class ErrorHandlingViewTestCase: XCTestCase {

    var sut: ErrorHandlingView!
    
    override func setUp() {
        super.setUp()
        sut = ErrorHandlingView(frame: UIScreen.main.bounds)
        sut.errorString = "Testando tela de error"
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testErrorHandling() {
        assertSnapshot(matching: sut, as: .image)
    }
}
