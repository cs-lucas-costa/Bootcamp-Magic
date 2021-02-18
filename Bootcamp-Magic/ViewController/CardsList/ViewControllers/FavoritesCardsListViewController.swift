//
//  FavoritesCardsListViewController.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 18/02/21.
//

import UIKit

final class FavouritesCardsListViewController: UIViewController, CardsListViewControllerProtocol {
    
    // MARK: Properties
    let cardsListView: CardsListView
    let viewModel: CardListViewModel
    
    // MARK: Delegates and DataSources
    var dataSource: CardsListDataSource?
    var cardListDelegate: CardsListDelegate?
    var searchViewDelegate: CardsListSearchViewDelegate?
    weak var coordinator: CardsListCoordinatorProtocol?
    
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
    
    override func loadView() {
        super.loadView()
        view = cardsListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardsListView.title = "Favorites"
        
        // (- Realizar o fetch das cartas favoritas). (todo)        
    }
}
