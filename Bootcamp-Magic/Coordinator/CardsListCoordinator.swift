//
//  CardsListCoordinator.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 18/02/21.
//

import UIKit

protocol CardsListCoordinatorProtocol: Coordinatable {
    func showCardDetail(_ cards: [CardViewModel])
}

//final class CardsListCoordinator: Coordinatable {
//
//    private let state: CardsListViewState
//    var currentViewController: UIViewController?
//    var navigationController: UINavigationController
//
//    init(navigationController: UINavigationController,
//         state: CardsListViewState) {
//        self.navigationController = navigationController
//        self.state = state
//    }
//
//    func start() {
//        let viewController = startViewController()
//        viewController.coordinator = self
//        currentViewController = viewController
//        navigationController.pushViewController(viewController, animated: true)
//    }
//}
//
//// MARK: Private methods
//private extension CardsListCoordinator {
//    func startViewController() -> CardsListViewControllerProtocol {
//        switch state {
//        case .all(let expansion):
//            return AllCardsListViewController(numberOfCardsPerRow: 3,
//                                              viewModel: CardListViewModel(),
//                                              with: expansion)
//        case .favourites:
//            return FavouritesCardsListViewController(numberOfCardsPerRow: 3,
//                                                    viewModel: CardListViewModel())
//        }
//    }
//}
//
//// MARK: Delegates
//extension CardsListCoordinator: CardsListCoordinatorProtocol {
//
//    func showCardDetail(_ card: CardViewModel) {
//        // TODOs: Realizar chamada coordinator de detalhes
//
//    }
//
//}
