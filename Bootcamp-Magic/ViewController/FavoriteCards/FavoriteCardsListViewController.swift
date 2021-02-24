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
      
      viewModel.fetchCards(setCode: "") { [weak self] (error) in
          guard let self = self else { return }
          
          DispatchQueue.main.async {
              if let error = error {
                  print("Error to fetch cards - \(error)")
              } else {
                  self.setupDataSources()
                  self.setupClosures()
                  self.cardsListView.collectionView.reloadData()
              }
              
              self.cardsListView.isLoading = false
          }
      }
    }
  
  // MARK: - ViewWillAppear
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = true
  }
  
  // MARK: - Methods
  func setupNavigationTitle() {
    cardsListView.title = Constants.String.TabBar.favorites
  }
}
