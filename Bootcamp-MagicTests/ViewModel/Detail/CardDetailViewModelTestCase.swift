//
//  CardDetailViewModelTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by pedro.silveira on 18/02/21.
//

import XCTest
@testable import Bootcamp_Magic

class CardDetailViewModelTestCase: XCTestCase {

    var sut: CardDetailViewModel!
    var networkManager: NetworkManager!
    var serviceStub: NetworkServiceStub!
    var fakeCardsArray: FakeCardsArray!

    override func setUp() {
        super.setUp()
        fakeCardsArray = FakeCardsArray()
        let bundle = Bundle(for: type(of: self))
        serviceStub = NetworkServiceStub(bundle: bundle)
        serviceStub.json = bundle.url(forResource: "cards", withExtension: "json")
        networkManager = NetworkManager(service: serviceStub)
        sut = CardDetailViewModel(expansionCards: fakeCardsArray.getCards())
    }

    override func tearDown() {
        sut = nil
        networkManager = nil
        serviceStub = nil
        fakeCardsArray = nil
        super.tearDown()
    }

    func testSendCardsBehavior() {
        let cards = sut.sendCards()
        
        XCTAssertEqual(cards.count, 3)
    }

    func testGetAndSendExpansionNameBehavior() {
        sut.setExpansionIndex(index: 0)
        
        let expansionName: String = sut.sendExpansionName()
        let cards = sut.sendCards()
        
        XCTAssertEqual(expansionName, cards[0].name)
    }
}
