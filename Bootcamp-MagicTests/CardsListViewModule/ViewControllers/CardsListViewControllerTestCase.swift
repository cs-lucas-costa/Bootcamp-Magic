//
//  CardsListViewControllerTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 18/02/21.
//

import XCTest

@testable import Bootcamp_Magic

class CardsListViewControllerTestCase: XCTestCase {

    var sut: CardsListViewControllerProtocol!
    var viewModel: CardListViewModel!
    
    override func setUp() {
        super.setUp()
        
        let bundle = Bundle(for: type(of: self))
        let service = NetworkServiceStub(bundle: bundle)
        service.json = bundle.url(forResource: "cards", withExtension: "json")
        viewModel = CardListViewModel(networkManager: NetworkManager(service: service))
        sut = AllCardsListViewController(numberOfCardsPerRow: 3,
                                      viewModel: viewModel,
                                      with: ExpansionViewModel(expansion: .fixture()))
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSelectCard() {
        
        let delegate = CardsListDelegateSpy(dictCards: viewModel.dictCards)
        let coordinator = CardsListCoordinatorSpy()
        
        sut.coordinator = coordinator
        sut.viewDidLoad()
        
        sut.cardListDelegate = delegate
        sut.setupClosures()
        
        sut.cardListDelegate?.collectionView(UICollectionView(frame: .init(),
                                                              collectionViewLayout: .init()),
                                             didSelectItemAt: IndexPath(item: 0, section: 0))
        
        XCTAssertTrue(coordinator.selectCard)
        
    }
    
    func testSearchCards() {

        let delegate = CardsListSearchViewDelegateSpy()
        sut.searchViewDelegate = delegate

        sut.viewDidLoad()
        sut.cardsListView.searchView.delegate?.textDidChange("")

        #warning("refact search cards")
//        XCTAssertTrue(delegate.isChangeText)
    }

    func testCancelSearchCards() {

        let delegate = CardsListSearchViewDelegateSpy()
        sut.searchViewDelegate = delegate

        sut.viewDidLoad()
        sut.cardsListView.searchView.delegate?.didCancelSearch()

        #warning("refact search cards")
//        XCTAssertTrue(delegate.isCancelSearch)
    }
    
}
