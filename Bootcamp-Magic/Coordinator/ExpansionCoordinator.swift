//
//  ExpansionCoordinator.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 17/02/21.
//

import UIKit

final class ExpansionCoordinator: Coordinatable {
  
  // MARK: - State
  enum State {
    case expansion
    case favourites
    case all(expansion: ExpansionViewModel)
  }
    
  // MARK: - Properties
  var currentViewController: UIViewController?
  var navigationController: UINavigationController
  var state = State.expansion
    
  init(navigationController: UINavigationController = UINavigationController()) {
    self.navigationController = navigationController
  }
    
  func start() {
    let viewController = startViewController()
    navigationController.pushViewController(viewController, animated: true)
    currentViewController = viewController
  }
}

// MARK: - Methods
extension ExpansionCoordinator {
    func startViewController() -> UIViewController {
        switch state {
        case .expansion:
          let expansionViewController = ExpansionViewController()
          expansionViewController.navigationDelegate = self
          return expansionViewController
        case .all(let expansion):
            return AllCardsListViewController(numberOfCardsPerRow: 3,
                                              viewModel: CardListViewModel(),
                                              with: expansion)
        case .favourites:
            return FavouritesCardsListViewController(numberOfCardsPerRow: 3,
                                                    viewModel: CardListViewModel())
        }
    }
}

// MARK: - ExpansionViewControllerNavigationDelegate Extension
extension ExpansionCoordinator: ExpansionViewControllerNavigationDelegate {
  func expansionSelected(_ expansion: Expansion) {
    let viewModel = ExpansionViewModel(expansion: expansion)
    state = .all(expansion: viewModel)
    
    let viewController = startViewController()
    navigationController.pushViewController(viewController, animated: true)
    currentViewController = viewController
  }
}
