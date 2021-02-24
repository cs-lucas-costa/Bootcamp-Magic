//
//  MainCoordinator.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 15/02/21.
//

import UIKit

final class MainCoordinator: Coordinatable {
    
    // MARK: - Properties
    private let networkManager = NetworkManager()
    private let dataBaseManager = CoreDataDB()
    lazy var expansionCoordinator = ExpansionCoordinator(networkManager: networkManager)
    lazy var favoriteCardsCoordinator = FavoriteCardsCoordinator(networkManager: networkManager, dataBaseManager: dataBaseManager)
    var currentViewController: UIViewController?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    func start() {
        expansionCoordinator.start()
        favoriteCardsCoordinator.start()
        
        currentViewController = NavigationMenuTabBarController(frame: UIScreen.main.bounds, controllers: [expansionCoordinator.navigationController, favoriteCardsCoordinator.navigationController])
    }
}
