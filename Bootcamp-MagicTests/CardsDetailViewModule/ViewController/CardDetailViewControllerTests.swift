//
//  CardDetailViewControllerTests.swift
//  Bootcamp-MagicTests
//
//  Created by pedro.silveira on 19/02/21.
//

import XCTest
import SnapshotTesting

@testable import Bootcamp_Magic

final class CardDetailViewControllerTests: XCTestCase {

    var sut: CardDetailViewControllerProtocol!
    var viewModel: CardDetailViewModel!
    
    override func setUp() {
        super.setUp()
        
        let bundle = Bundle(for: type(of: self))
        let service = NetworkServiceStub(bundle: bundle)
        service.json = bundle.url(forResource: "cards", withExtension: "json")
        viewModel = CardDetailViewModel(expansionCards: FakeCardsArray().getCards())
        sut = CardDetailViewController(viewModel: viewModel)
        sut.loadView()
        sut.viewDidLoad()
//        isRecording = true
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
    
    func testCardDetail() {
        assertSnapshot(matching: sut, as: .image)
    }
    
    func testDidOffsetChangedBehavior() {
        
        let firstIndex = viewModel.actualIndex
        
        sut.cardDetailView.frame = UIScreen.main.bounds
        sut.cardDetailView.detailCollectionView.frame = UIScreen.main.bounds
        
        let offset = CGFloat(1000)
        
        sut.didOffsetChanged(offset: offset, toPrevious: false)
        
        let finalIndex = viewModel.actualIndex
        
        XCTAssertNotEqual(firstIndex, finalIndex)
    }
}
