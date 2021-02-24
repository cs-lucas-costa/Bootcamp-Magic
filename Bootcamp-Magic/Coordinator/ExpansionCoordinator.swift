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
        case all(expansion: ExpansionViewModel)
    }
    
    // MARK: - Properties
    var currentViewController: UIViewController?
    var navigationController: UINavigationController
    var state = State.expansion
    private let networkManager: NetworkManager
    private let databaseManager: DatabaseProtocol
    
    init(navigationController: UINavigationController = UINavigationController(),
         networkManager: NetworkManager, dataBaseManager: DatabaseProtocol) {
        self.navigationController = navigationController
        self.networkManager = networkManager
        self.databaseManager = dataBaseManager
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
                                                            viewModel: CardListViewModelRemote(
                                                              networkManager: networkManager, dataBaseManager: databaseManager),
                                                            with: expansion)
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
    
    func showCardDetail(at index: Int, cards: [CardViewModel]) {
        
        cards.forEach { $0.verifyIsFavorite() }
        
        let viewModel = CardDetailViewModel(expansionCards: cards)
        viewModel.setExpansionIndex(index: index)
        
        let viewController = CardDetailViewController(viewModel: viewModel)
        viewController.modalPresentationStyle = .fullScreen
        currentViewController = viewController
        
        navigationController.present(viewController, animated: true, completion: nil)
    }
}
