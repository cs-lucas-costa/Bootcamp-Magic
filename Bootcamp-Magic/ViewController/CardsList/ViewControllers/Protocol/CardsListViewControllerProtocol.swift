//
//  CardsListViewControllerProtocol.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 18/02/21.
//

import UIKit

protocol CardsListViewControllerProtocol: UIViewController,
                                          CardsListSearchViewDelegate,
                                          CardsListViewDelegate,
                                          ErrorDidOccurDelegate {
    
    var cardsListView: CardsListView { get }
    var coordinator: CardsListCoordinatorProtocol? { get set }
    var cardListDelegate: CardsListDelegate? { get set }
    var searchViewDelegate: CardsListSearchViewDelegate? { get set }
    var dataSource: CardsListDataSource? { get set }
    var viewModel: CardListViewModel { get }
    var setCode: String { get }
    
    func setupDelegates()
    func setupDataSources()
    func setupClosures()
    func fetchCards()
}

// MARK: Default implementations
extension CardsListViewControllerProtocol {
    
    func fetchCards() {
        
        cardsListView.isLoading = true
        
        viewModel.fetchCards(setCode: setCode) { [weak self] (error) in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                if let error = error {
                    self.cardsListView.failableView.errorString = error.localizedDescription
                    self.cardsListView.addFailableView()
                } else {
                    self.setupDataSources()
                    self.setupClosures()
                    self.cardsListView.collectionView.reloadData()
                }
                
                self.cardsListView.isLoading = false
            }
        }
    }
    
    func setupDataSources() {
        dataSource = CardsListDataSource(dictCards: viewModel.dictCards)
        cardsListView.collectionView.dataSource = dataSource
    }
    
    func setupDelegates() {
        cardListDelegate = CardsListDelegate()
        cardsListView.collectionView.delegate = cardListDelegate
        cardsListView.searchView.delegate = searchViewDelegate ?? self
        cardsListView.delegate = self
        viewModel.delegate = self
    }
        
    func setupClosures() {
        cardListDelegate?.didSelectCard = { [weak self] indexPath in
            guard let self = self else { return }
            let cards = self.viewModel.dictCards[indexPath.section].value
            self.coordinator?.showCardDetail(at: indexPath.item, cards: cards)
        }
    }
    
}

// MARK: CardsListSearchViewDelegate
extension CardsListViewControllerProtocol {
    
    func textDidChange(_ text: String) {
        
        let filter = !text.isEmpty
        dataSource?.filter = (filter, text)
        
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

// MARK: CardsListDelegate
extension CardsListViewControllerProtocol {
    
    func dismiss() {
        navigationController?.popViewController(animated: true)
    }
    
}
