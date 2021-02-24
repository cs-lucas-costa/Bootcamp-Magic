//
//  NavigationMenuTabBarControllerTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by luis.gustavo.jacinto on 19/02/21.
//

import XCTest
import SnapshotTesting
@testable import Bootcamp_Magic

class NavigationMenuTabBarControllerTestCase: XCTestCase {

  // MARK: - Properties
  var sut: NavigationMenuTabBarController!
  
  // MARK: - Setup
  override func setUp() {
    super.setUp()
    sut = NavigationMenuTabBarController(frame: .init(origin: .zero, size: CGSize(width: 500, height: 800)), controllers: [])
//    isRecording = true
  }
  
  // MARK: - Teardown
  override func tearDown() {
    sut = nil
    super.tearDown()
  }
  
  // MARK: - Tests
  func testNavigationMenuTabBarController() {
    assertSnapshot(matching: sut, as: .image)
  }

}
