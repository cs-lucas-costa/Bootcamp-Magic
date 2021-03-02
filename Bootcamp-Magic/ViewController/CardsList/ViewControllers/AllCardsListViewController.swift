//
//  CardsListViewController.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 17/02/21.
//

import UIKit

final class AllCardsListViewController: BaseCardsListViewController {
    
    let expansionViewModel: ExpansionViewModel
        
    init(numberOfCardsPerRow: Int, viewModel: CardListViewModel, with expansionViewModel: ExpansionViewModel, dataSource: CardsListDataSource) {
        self.expansionViewModel = expansionViewModel
        super.init(numberOfCardsPerRow: numberOfCardsPerRow, viewModel: viewModel, dataSource: dataSource)
        self.cardsListView = CardsListView(numberOfCardsPerRow: 3, state: .all(expansion: expansionViewModel))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardsListView.title = expansionViewModel.name
        setupExpansionCode(expansionViewModel.code)
        setupDelegates()
        fetchCards()
    }
    
}
