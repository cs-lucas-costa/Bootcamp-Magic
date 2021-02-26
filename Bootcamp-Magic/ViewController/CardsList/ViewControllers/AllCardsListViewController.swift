//
//  CardsListViewController.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 17/02/21.
//

import UIKit

final class AllCardsListViewController: UIViewController, CardsListViewControllerProtocol {
    
    // MARK: Properties
    private let expansionViewModel: ExpansionViewModel
    let cardsListView: CardsListView
    let viewModel: CardListViewModel
    
    // MARK: Delegates and DataSources
    var dataSource: CardsListDataSource?
    var cardListDelegate: CardsListDelegate?
    var searchViewDelegate: CardsListSearchViewDelegate?
    weak var coordinator: CardsListCoordinatorProtocol?
    
    var setCode: String {
        expansionViewModel.code
    }
    
    init(numberOfCardsPerRow: Int,
         viewModel: CardListViewModel,
         with expansionViewModel: ExpansionViewModel) {
        
        self.cardsListView = CardsListView(numberOfCardsPerRow: 3,
                                           state: .all(expansion: expansionViewModel))
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardsListView.title = expansionViewModel.name
        setupDelegates()
        fetchCards()
    }
    
    @objc func retryLoadData() {
        fetchCards()
        
        DispatchQueue.main.async { [weak self] in
            self?.view = self?.cardsListView
            self?.cardsListView.removeFailableView()
        }
    }
}

extension AllCardsListViewController {
    func errorDidOccur(error: String) {
        DispatchQueue.main.async { [weak self] in
            self?.cardsListView.failableView.retryButton.addTarget(self, action: #selector(self?.retryLoadData), for: .touchUpInside)
        }
    }
}
