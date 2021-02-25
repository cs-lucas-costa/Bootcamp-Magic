//
//  TabNavigationMenuTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by luis.gustavo.jacinto on 19/02/21.
//

import XCTest
import SnapshotTesting
@testable import Bootcamp_Magic

class TabNavigationMenuTestCase: XCTestCase {

  // MARK: - Properties
  var sut: TabNavigationMenu!
  
  // MARK: - Setup
  override func setUp() {
    super.setUp()
    sut = TabNavigationMenu(frame: .init(origin: .zero, size: CGSize(width: 200, height: 49)))
//    isRecording = true
  }

  // MARK: - Teardown
  override func tearDown() {
    super.tearDown()
    sut = nil
  }
  
  // MARK: - Tests
  func testTabNavigationMenu() {
    assertSnapshot(matching: sut, as: .image)
  }
}
