//
//  FavoriteCardsCoordinator.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 24/02/21.
//

import UIKit

final class FavoriteCardsCoordinator: Coordinatable {
  
  // MARK: - Properties
  private let networkManager: NetworkManager
  var currentViewController: UIViewController?
  var navigationController: UINavigationController
  
  // MARK: - Inits
  init(navigationController: UINavigationController = UINavigationController(), networkManager: NetworkManager) {
    self.navigationController = navigationController
    self.networkManager = networkManager
  }
  
  // MARK: - Methods
  func start() {
    let viewController = FavoriteCardsListViewController(numberOfCardsPerRow: 3,
                                                         viewModel: CardListViewModelLocal(networkManager: networkManager))
    viewController.coordinator = self
    navigationController.pushViewController(viewController, animated: true)
    currentViewController = viewController
  }
}

// MARK: - Extension
extension FavoriteCardsCoordinator: CardsListCoordinatorProtocol {
  func showCardDetail(_ cards: [CardViewModel]) {
      let viewModel = CardDetailViewModel(expansionCards: cards)
      let viewController = CardDetailViewController(viewModel: viewModel)
      currentViewController = viewController
      navigationController.present(viewController, animated: true, completion: nil)
  }
  
  func dismiss() {
      navigationController.popViewController(animated: true)
  }
}
