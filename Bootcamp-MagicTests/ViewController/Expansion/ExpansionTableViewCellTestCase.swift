//
//  ExpansionTableViewCellTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by luis.gustavo.jacinto on 18/02/21.
//

import XCTest
@testable import Bootcamp_Magic
import SnapshotTesting

class ExpansionTableViewCellTestCase: XCTestCase {

  // MARK: - Properties
  let expansion = Expansion(code: "", name: "Alliances")
  var sut: ExpansionTableViewCell!
    
  // MARK: - Setup
  override func setUp() {
    super.setUp()
    sut = ExpansionTableViewCell(style: .default, reuseIdentifier: "")
    
  }
  
  // MARK: - TearDown
  override func tearDown() {
    super.tearDown()
    sut = nil
  }

  // MARK: - Tests
  func testExpansionViewCellWithImage() {
    let image = UIImage(named: "right-chevron")
    
    sut.setupCell(with: expansion, image: image)
    
    assertSnapshot(matching: sut, as: .image)
  }
  
  func testExpansionViewCellWithoutImage() {
    sut.setupCell(with: expansion)
    
    assertSnapshot(matching: sut, as: .image)
  }
  
  func testExpansionViewCellWithDivisor() {
    sut.setupCell(with: expansion)
    sut.showDivisor()
    
    assertSnapshot(matching: sut, as: .image)
  }
  
  func testExpansionViewCellWithoutDivisor() {
    sut.setupCell(with: expansion)
    sut.hideDivisor()
    
    assertSnapshot(matching: sut, as: .image)
  }

}
