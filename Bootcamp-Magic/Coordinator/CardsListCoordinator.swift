//
//  CardsListCoordinator.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 18/02/21.
//

import UIKit

protocol CardsListCoordinatorProtocol: AnyObject {
    func showCardDetail(_ card: CardViewModel)
}

final class CardsListCoordinator: Coordinatable {
    
    private let expansionViewModel: ExpansionViewModel
    var currentViewController: UIViewController?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, expansionViewModel: ExpansionViewModel) {
        self.expansionViewModel = expansionViewModel
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = CardsListViewController(numberOfCardsPerRow: 3,
                                                     viewModel: CardListViewModel(),
                                                     with: expansionViewModel)
        viewController.coordinator = self
        currentViewController = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
    
}

// MARK: Delegates
extension CardsListCoordinator: CardsListCoordinatorProtocol {
    
    func showCardDetail(_ card: CardViewModel) {
        // TODOs: Realizar chamada coordinator de detalhes
        
    }
    
}
