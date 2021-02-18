//
//  ExpansionViewControllerScreenTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by luis.gustavo.jacinto on 18/02/21.
//

import XCTest
@testable import Bootcamp_Magic
import SnapshotTesting

class ExpansionViewControllerScreenTestCase: XCTestCase {
  
  // MARK: - Properties
  var sut: ExpansionViewControllerScreen!
  var dataSource: ExpansionViewControllerDataSource!
  let expasions = [Expansion(code: "", name: "Alliances"), Expansion(code: "", name: "Alliances")]
  let image = UIImage(named: "right-chevron")
   
  // MARK: - Setup
  override func setUp() {
    super.setUp()
    sut = ExpansionViewControllerScreen(frame: .init(origin: .zero, size: CGSize(width: 500, height: 800)))
    dataSource = ExpansionViewControllerDataSource(expansions: expasions)
    sut.tableView.delegate = dataSource
    sut.tableView.dataSource = dataSource
    sut.tableView.register(ExpansionTableViewCell.self, forCellReuseIdentifier: Constants.ExpasionTableViewCell.identifier)
 }
   
  // MARK: - TearDown
  override func tearDown() {
    super.tearDown()
    sut = nil
    dataSource = nil
  }

  // MARK: - Tests
  func testExpansionViewControllerScreen() {
    assertSnapshot(matching: sut, as: .image)
  }
}
