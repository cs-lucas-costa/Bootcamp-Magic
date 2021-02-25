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
    private let dataBaseManager: DatabaseProtocol
    var currentViewController: UIViewController?
    var navigationController: UINavigationController
    private var childCoordinators: [Coordinatable] = []
    
    // MARK: - Inits
    init(navigationController: UINavigationController = UINavigationController(), networkManager: NetworkManager, dataBaseManager: DatabaseProtocol) {
        self.navigationController = navigationController
        self.networkManager = networkManager
        self.dataBaseManager = dataBaseManager
    }
    
    // MARK: - Methods
    func start() {
        let viewController = FavoriteCardsListViewController(numberOfCardsPerRow: 3,
                                                             viewModel: CardListViewModelLocal(networkManager: networkManager, dataBaseManager: dataBaseManager))
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
        currentViewController = viewController
    }
}

// MARK: - Extension
extension FavoriteCardsCoordinator: CardsListCoordinatorProtocol {
    
    func showCardDetail(at index: Int, cards: [CardViewModel]) {
        let viewModel = CardDetailViewModel(expansionCards: cards)
        viewModel.setExpansionIndex(index: index)
        
        let coordinator = CardDetailCoordinator(navigationController: navigationController, viewModel: viewModel)
        coordinator.delegate = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}

extension FavoriteCardsCoordinator: CardDetailCoordinatorDelegate {
    
    func didDismiss() {
        guard let viewController = currentViewController as? FavoriteCardsListViewController else {
            return
        }
        viewController.fetchCards()
    }
}
