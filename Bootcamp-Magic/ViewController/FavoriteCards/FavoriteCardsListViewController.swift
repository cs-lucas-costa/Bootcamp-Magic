//
//  FavoriteCardsListViewController.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 18/02/21.
//

import UIKit

final class FavoriteCardsListViewController: UIViewController, CardsListViewControllerProtocol {
    
    // MARK: Properties
    let cardsListView: CardsListView
    let viewModel: CardListViewModel
    
    // MARK: Delegates and DataSources
    var dataSource: CardsListDataSource?
    var cardListDelegate: CardsListDelegate?
    var searchViewDelegate: CardsListSearchViewDelegate?
    weak var coordinator: CardsListCoordinatorProtocol?
    let setCode: String = ""
    
    init(numberOfCardsPerRow: Int,
         viewModel: CardListViewModel) {
        
        self.cardsListView = CardsListView(numberOfCardsPerRow: 3,
                                           state: .favourites)
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LoadView
    override func loadView() {
        super.loadView()
        view = cardsListView
        view.backgroundColor = .green
    }
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationTitle()
        setupDelegates()
    }
    
    // MARK: - ViewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        fetchCards()
    }
    
    // MARK: - Methods
    func setupNavigationTitle() {
        cardsListView.title = Constants.String.TabBar.favorites
    }
    
    @objc func retryLoadData() {
        fetchCards()
        view = cardsListView
    }
}

extension FavoriteCardsListViewController {
    func errorDidOccur(error: String) {
        DispatchQueue.main.async { [weak self] in
            let errorHandlingView = ErrorHandlingView(error: error)
            
            errorHandlingView.retryButton.addTarget(self, action: #selector(self?.retryLoadData), for: .touchUpInside)
            self?.view = errorHandlingView
        }
    }
}
