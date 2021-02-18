//
//  NetworkManagerRetrievingImageTests.swift
//  Bootcamp-MagicTests
//
//  Created by pedro.silveira on 18/02/21.
//

import Foundation
import XCTest
@testable import Bootcamp_Magic

final class NetworkManagerRetrievingImageTests: XCTestCase {

    var service: ImageRetrievingNetworkServiceStub!
    var sut: NetworkManager!

    override func setUp() {
        super.setUp()
        let bundle = Bundle(for: type(of: self))
        service = ImageRetrievingNetworkServiceStub(bundle: bundle)
        sut = NetworkManager(service: service)
    }

    override func tearDown() {
        service = nil
        sut = nil
        super.tearDown()
    }
    
    func testGetImageFromURLBehavior() {
        
        let expectation = XCTestExpectation()
        
        do {
            
            let path = try XCTUnwrap(service.bundle.path(forResource: "Image.ashx", ofType: "jpeg"))

            let imageService = ImagesService.cardImage(imagePath: path)

            self.sut.getImageFromURL(imagesService: imageService) { response in
                switch response {
                case .success(let result):
                    XCTAssertNotNil(result)
                    expectation.fulfill()
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                    expectation.fulfill()
                }
            }

        } catch {
            XCTFail("Failed to attempt to decode data ")
        }
        
        wait(for: [expectation], timeout: 1)
    }

}
