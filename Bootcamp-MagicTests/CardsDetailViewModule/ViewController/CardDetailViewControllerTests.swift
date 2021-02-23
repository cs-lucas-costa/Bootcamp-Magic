//
//  CardDetailViewControllerTests.swift
//  Bootcamp-MagicTests
//
//  Created by pedro.silveira on 19/02/21.
//

import XCTest

@testable import Bootcamp_Magic

final class CardDetailViewControllerTests: XCTestCase {

    var sut: CardDetailViewController!
    var viewModel: CardDetailViewModel!
    
    override func setUp() {
        super.setUp()
        
        let bundle = Bundle(for: type(of: self))
        let service = NetworkServiceStub(bundle: bundle)
        service.json = bundle.url(forResource: "cards", withExtension: "json")
        viewModel = CardDetailViewModel(networkManager: NetworkManager(service: service), expansionCards: FakeCardsArray().getCards())
        sut = CardDetailViewController(viewModel: viewModel)
    }
    
    override func tearDown() {
        sut = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testUpdateUIBehavior() {
        viewModel.setExpansionIndex(index: 0)
        let cardName = viewModel.sendFirtsExpansionName()
        let cards = viewModel.sendCards()
        
        XCTAssertEqual(cardName, cards[0].name)
    }
}
