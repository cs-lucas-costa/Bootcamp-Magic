//
//  CardDetailViewControllerProtocol.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 22/02/21.
//

import UIKit

protocol CardDetailViewControllerProtocol: UIViewController,
                                          CardsListSearchViewDelegate,
                                          CardsListViewDelegate {
    
    var cardsListView: CardsListView { get }
    var cardDetailDelegate: CardDetailCollectionViewDelegate? { get set }
    var collectionViewDataSource: CardDetailCollectionViewDataSource? { get set }
    var viewModel: CardDetailViewModel { get }
    
    func setupDelegates()
    func setupDataSources()
    func setupClosures()    
}

//// MARK: Default implementations
//extension CardDetailViewControllerProtocol {
//    
//    func setupDataSources() {
//        dataSource = CardsListDataSource(dictCards: viewModel.dictCards)
//        cardsListView.collectionView.dataSource = dataSource
//    }
//    
//    func setupDelegates() {
//        cardListDelegate = CardsListDelegate()
//        cardsListView.collectionView.delegate = cardListDelegate
//        cardsListView.searchView.delegate = searchViewDelegate ?? self
//        cardsListView.delegate = self
//    }
//        
//    func setupClosures() {
//        cardListDelegate?.didSelectCard = { [weak self] indexPath in
//            guard let self = self else { return }
//            let cards = self.viewModel.dictCards[indexPath.section].value
//            self.coordinator?.showCardDetail(cards)
//        }
//    }
//    
//}
//
//// MARK: CardsListSearchViewDelegate
//extension CardDetailViewControllerProtocol {
//    
//    func textDidChange(_ text: String) {
//        
//        let filter = !text.isEmpty
//        dataSource?.filter = (filter, text)
//        
//        DispatchQueue.main.async {
//            self.cardsListView.collectionView.reloadData()
//        }
//    }
//    
//    func didCancelSearch() {
//        dataSource?.filter = (false, "")
//        
//        DispatchQueue.main.async {
//            self.cardsListView.collectionView.reloadData()
//        }
//    }
//}
