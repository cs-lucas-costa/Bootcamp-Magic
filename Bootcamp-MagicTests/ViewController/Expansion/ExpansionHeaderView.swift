//
//  ExpansionHeaderView.swift
//  Bootcamp-MagicTests
//
//  Created by luis.gustavo.jacinto on 18/02/21.
//

import XCTest
import SnapshotTesting
@testable import Bootcamp_Magic

class ExpansionHeaderViewTestCase: XCTestCase {

  // MARK: - Properties
  var sut: ExpansionHeaderView!
  
  // MARK: - Setup
  override func setUp() {
    super.setUp()
    sut = ExpansionHeaderView(frame: CGRect(origin: .zero, size: CGSize(width: 600, height: 200)), character: "A")
  }
  
  // MARK: - TearDown
  override func tearDown() {
    super.tearDown()
    sut = nil
  }
  
  // MARK: - Tests
  func testExpansionHeaderView() {
    assertSnapshot(matching: sut, as: .image)
  }
}
