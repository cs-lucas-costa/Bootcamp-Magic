//
//  FavoriteCardsListViewController.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 18/02/21.
//

import UIKit

final class FavoriteCardsListViewController: BaseCardsListViewController {
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        setupNavigationTitle()
        super.viewDidLoad()
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
}
