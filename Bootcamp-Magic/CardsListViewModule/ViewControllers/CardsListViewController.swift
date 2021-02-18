//
//  CardsListViewController.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 17/02/21.
//

import UIKit

final class CardsListViewController: UIViewController {

    private let cardsListView: CardsListView
    private let viewModel: CardListViewModel
    private let expansionViewModel: ExpansionViewModel
    
    var dataSource: CardsListDataSource?
    var cardListDelegate: CardsListDelegate? //Não pode ser weak
    weak var coordinator: CardsListCoordinatorProtocol?
    
    init(numberOfCardsPerRow: Int,
         viewModel: CardListViewModel,
         with expansionViewModel: ExpansionViewModel) {
        
        self.cardsListView = CardsListView(numberOfCardsPerRow: numberOfCardsPerRow)
        self.viewModel = viewModel
        self.expansionViewModel = expansionViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = cardsListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardsListView.expansionTitle = expansionViewModel.name
        cardsListView.searchView.delegate = self
        
        viewModel.fetchCards(setCode: expansionViewModel.code) { [weak self] (error) in
            guard let self = self else { return }
            
            if let error = error {
                print("Error to fetch cards - \(error)")
            } else {
                self.cardListDelegate = CardsListDelegate(dictCards: self.viewModel.dictCards)
                self.dataSource = CardsListDataSource(dictCards: self.viewModel.dictCards)
                
                self.cardsListView.collectionView.dataSource = self.dataSource
                self.cardsListView.collectionView.delegate = self.cardListDelegate
                self.cardsListView.collectionView.reloadData()
            }
        }
        
        showCardDetail()
    }
}

// MARK: CardsListSearchViewDelegate
extension CardsListViewController: CardsListSearchViewDelegate {
    
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

// MARK: Actions
private extension CardsListViewController {
    func showCardDetail() {
        cardListDelegate?.didSelectCard = { [weak self] card in
            self?.coordinator?.showCardDetail(card)
        }
    }
}
