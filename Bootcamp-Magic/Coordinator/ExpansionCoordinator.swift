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
    private let networkManager: NetworkManager
    
    init(navigationController: UINavigationController = UINavigationController(),
         networkManager: NetworkManager) {
        self.navigationController = navigationController
        self.networkManager = networkManager
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
            let viewController = AllCardsListViewController(numberOfCardsPerRow: 3,
                                                            viewModel: CardListViewModel(
                                                                networkManager: networkManager),
                                                            with: expansion)
            viewController.coordinator = self
            return viewController
        case .favourites:
            let viewController = FavouritesCardsListViewController(numberOfCardsPerRow: 3,
                                                                   viewModel: CardListViewModel(
                                                                    networkManager: networkManager))
            viewController.coordinator = self
            return viewController
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

// MARK: - CardsListCoordinatorProtocol Extension
extension ExpansionCoordinator: CardsListCoordinatorProtocol {
    func showCardDetail(_ cards: [CardViewModel]) {
        let viewModel = CardDetailViewModel(networkManager: networkManager,
                                            expansionCards: cards)
        let viewController = CardDetailViewController(viewModel: viewModel)
        currentViewController = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
}
