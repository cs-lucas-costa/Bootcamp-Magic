//
//  CardsListViewControllerTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 18/02/21.
//

import XCTest

@testable import Bootcamp_Magic

class CardsListViewControllerTestCase: XCTestCase {

    var sut: CardsListViewController!
    var viewModel: CardListViewModel!
    
    override func setUp() {
        super.setUp()
        
        let service = NetworkServiceStub(bundle: Bundle(for: type(of: self)))
        viewModel = CardListViewModel(networkManager: NetworkManager(service: service))
        sut = CardsListViewController(numberOfCardsPerRow: 3,
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
        
        sut.cardListDelegate = delegate
        sut.coordinator = coordinator
        
        sut.viewDidLoad()
        
        sut.cardListDelegate?.collectionView(UICollectionView(frame: .init(), collectionViewLayout: .init()),
                                             didSelectItemAt: IndexPath(item: 0, section: 0))
        
        XCTAssertTrue(coordinator.selectCard)
        
    }
    
    func testSearchCards() {
        
        let delegate = CardsListSearchViewDelegateSpy()
        sut.searchViewDelegate = delegate
        
        sut.viewDidLoad()
        sut.cardsListView.searchView.delegate?.textDidChange("")
                
        XCTAssertTrue(delegate.isChangeText)
    }
    
    func testCancelSearchCards() {
        
        let delegate = CardsListSearchViewDelegateSpy()
        sut.searchViewDelegate = delegate
        
        sut.viewDidLoad()
        sut.cardsListView.searchView.delegate?.didCancelSearch()
                
        XCTAssertTrue(delegate.isCancelSearch)
    }
    
}
