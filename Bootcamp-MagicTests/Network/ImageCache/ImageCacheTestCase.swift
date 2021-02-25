//
//  ImageCacheTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by luis.gustavo.jacinto on 25/02/21.
//

import XCTest
@testable import Bootcamp_Magic

class ImageCacheTestCase: XCTestCase {

  // MARK: - Properties
  var sut: ImageCache!
  
  // MARK: - Setup
  override func setUp() {
    super.setUp()
    sut = ImageCache()
  }
  
  // MARK: - TearDown
  override func tearDown() {
    super.tearDown()
    sut = nil
  }
  
  // MARK: - Tests
  func testIfImageIsCached() {
    
    // Given
    let urlString = "test.com"
    let image = UIImage()
    let url = URL(string: urlString)!
    sut[url] = image
    
    XCTAssertNotNil(sut[url])
    XCTAssertEqual(sut[url], image)
  }
  
  func testIfImageIsNotCached() {
    
    // Given
    let urlString = "test.com"
    let url = URL(string: urlString)!
    
    XCTAssertNil(sut[url])
  }
}
