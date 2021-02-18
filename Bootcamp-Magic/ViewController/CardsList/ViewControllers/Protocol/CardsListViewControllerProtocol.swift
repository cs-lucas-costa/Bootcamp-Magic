//
//  CardsListViewControllerProtocol.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 18/02/21.
//

import UIKit

protocol CardsListViewControllerProtocol: UIViewController, CardsListSearchViewDelegate {
    
    var cardsListView: CardsListView { get }
    var coordinator: CardsListCoordinatorProtocol? { get set }
    var cardListDelegate: CardsListDelegate? { get set }
    var searchViewDelegate: CardsListSearchViewDelegate? { get set }
    var dataSource: CardsListDataSource? { get set }
    var viewModel: CardListViewModel { get }
    
    func setupDelegates()
    func setupDataSources()
    func setupClosures()
    
}

// MARK: Default implementations
extension CardsListViewControllerProtocol {
    
    func setupDataSources() {
        dataSource = CardsListDataSource(dictCards: viewModel.dictCards)
        cardsListView.collectionView.dataSource = dataSource
    }
    
    func setupDelegates() {
        cardListDelegate = CardsListDelegate(dictCards: viewModel.dictCards)
        cardsListView.collectionView.delegate = cardListDelegate
        cardsListView.searchView.delegate = searchViewDelegate ?? self
    }
        
    func setupClosures() {
        cardListDelegate?.didSelectCard = { [weak self] card in
            self?.coordinator?.showCardDetail(card)
        }
    }
    
}

// MARK: CardsListSearchViewDelegate
extension CardsListViewControllerProtocol {
    
    func textDidChange(_ text: String) {
        dataSource?.filter = (true, text)
        
        DispatchQueue.main.async {
            self.cardsListView.collectionView.reloadData()
        }
    }
    
    func didCancelSearch() {
        dataSource?.filter = (false, "")
        
        DispatchQueue.main.async {
            self.cardsListView.collectionView.reloadData()
        }
    }
    
}
