//
//  Sequence+ExtensionsTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by luis.gustavo.jacinto on 19/02/21.
//

import XCTest
@testable import Bootcamp_Magic

class Sequence_ExtensionsTestCase: XCTestCase {

  // MARK: - Setup
  override func setUp() {
    super.setUp()
  }
  
  // MARK: - Teardown
  override func tearDown() {
    super.tearDown()
  }
  
  // MARK: - Tests
  func testUniqueWithArrayOfUniqueValues() {
    let values = [1, 2, 3, 4, 5]
    let uniqueValues = values.unique(for: \.self)
    
    XCTAssertEqual(values, uniqueValues)
  }
  
  func testUniqueWithArrayOfNonUniqueValues() {
    let values = [1, 2, 2, 3, 4, 4, 5]
    let uniqueValues = values.unique(for: \.self)
    
    XCTAssertNotEqual(values, uniqueValues)
    XCTAssertEqual(5, uniqueValues.count)
  }

}
