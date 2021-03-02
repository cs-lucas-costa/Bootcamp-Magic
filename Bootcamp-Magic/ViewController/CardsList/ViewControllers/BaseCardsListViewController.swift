//
//  CardsListViewControllerProtocol.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 18/02/21.
//

import UIKit

class BaseCardsListViewController: UIViewController {
    
    // MARK: Properties
    var cardsListView: CardsListView
    let viewModel: CardListViewModel
    
    // MARK: Delegates and DataSources
    private let dataSource: CardsListDataSource
    var cardListDelegate: CardsListDelegate?
    var searchViewDelegate: CardsListSearchViewDelegate?
    weak var coordinator: CardsListCoordinatorProtocol?
    private var expansionCode: String = ""
            
    init(numberOfCardsPerRow: Int,
         viewModel: CardListViewModel,
         dataSource: CardsListDataSource) {
        
        self.viewModel = viewModel
        self.dataSource = dataSource
        self.cardsListView = CardsListView(numberOfCardsPerRow: 3)
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
        setupCardListViewDelegates()
    }
    
    @objc func retryLoadData() {
        fetchCards()
        
        DispatchQueue.main.async { [weak self] in
            self?.view = self?.cardsListView
            self?.cardsListView.removeFailableView()
        }
    }
    
    func setupExpansionCode(_ code: String) {
        self.expansionCode = code
    }
}

// MARK: Default implementations
extension BaseCardsListViewController {
    
    func fetchCards() {
        
        cardsListView.isLoading = true
        
        viewModel.fetchCards(setCode: expansionCode) { [weak self] (error) in
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
        dataSource.updateData(dictCards: viewModel.dictCards)
        cardsListView.collectionView.dataSource = dataSource
    }
    
    func setupDelegates() {
        viewModel.delegate = self
    }
    
    private func setupCardListViewDelegates() {
        cardListDelegate = CardsListDelegate()
        cardsListView.collectionView.delegate = cardListDelegate
        cardsListView.searchView.delegate = searchViewDelegate ?? self
        cardsListView.delegate = self
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
extension BaseCardsListViewController: CardsListSearchViewDelegate {
    
    func textDidChange(_ text: String) {
        
        let filter = !text.isEmpty
        dataSource.filter = (filter, text)
        
        DispatchQueue.main.async {
            self.cardsListView.collectionView.reloadData()
        }
    }
    
    func didCancelSearch() {
        dataSource.filter = (false, "")
        
        DispatchQueue.main.async {
            self.cardsListView.collectionView.reloadData()
        }
    }
}

// MARK: CardsListViewDelegate
extension BaseCardsListViewController: CardsListViewDelegate {
    
    func dismiss() {
        navigationController?.popViewController(animated: true)
    }
    
}

// MARK: ErrorDidOccur
extension BaseCardsListViewController: ErrorDidOccurDelegate {
    func errorDidOccur(error: String) {
        DispatchQueue.main.async { [weak self] in
            self?.cardsListView.failableView.retryButton.addTarget(self, action: #selector(self?.retryLoadData), for: .touchUpInside)
        }
    }
}
