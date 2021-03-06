//
//  NetworkManagerTests.swift
//  Bootcamp-MagicTests
//
//  Created by pedro.silveira on 16/02/21.
//
//
import Foundation
import XCTest
@testable import Bootcamp_Magic

final class NetworkManagerTests: XCTestCase {

    var service: NetworkServiceStub!
    var sut: NetworkManager!

    override func setUp() {
        super.setUp()
        let bundle = Bundle(for: type(of: self))
        service = NetworkServiceStub(bundle: bundle)
        sut = NetworkManager(service: service)
    }

    override func tearDown() {
        service = nil
        sut = nil
        super.tearDown()
    }

    func testSetGetBehavior() {

        let expectation = XCTestExpectation()

        let setService = CardsService.setList

        do {

            let fakeJSONURL = try XCTUnwrap(service.bundle.url(forResource: "sets-response", withExtension: "json"))
            let fakeJSONData = try Data(contentsOf: fakeJSONURL)
            let fakeJSON = try JSONDecoder().decode(ExpansionList.self, from: fakeJSONData)
            service.json = fakeJSONURL

            self.sut?.getRequest(cardsService: setService, decodableType: ExpansionList.self) { response in
                switch response {
                case .success(let result):
                    XCTAssertEqual(result, fakeJSON)
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

    func testCardGetBehavior() {

        let expectation = XCTestExpectation()

        let cardService = CardsService.cardsList(setCode: "AetherRevolt")

        do {

            let fakeJSONURL = try XCTUnwrap(service.bundle.url(forResource: "cards-response", withExtension: "json"))
            let fakeJSONData = try Data(contentsOf: fakeJSONURL)
            let fakeJSON = try JSONDecoder().decode(CardList.self, from: fakeJSONData)

            service.json = fakeJSONURL

            self.sut?.getRequest(cardsService: cardService, decodableType: CardList.self) { response in
                switch response {
                case .success(let result):
                    XCTAssertEqual(result, fakeJSON)
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
