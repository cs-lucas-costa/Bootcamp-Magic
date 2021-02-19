//
//  MainCoordinator.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 15/02/21.
//

import UIKit

final class MainCoordinator: Coordinatable {

  // MARK: - Properties
    let expansionCoordinator = ExpansionCoordinator(networkManager: NetworkManager())
  var currentViewController: UIViewController?
  var navigationController: UINavigationController
    
  init(navigationController: UINavigationController = UINavigationController()) {
    self.navigationController = navigationController
  }

  func start() {
    expansionCoordinator.start()

    currentViewController = NavigationMenuTabBarController(frame: UIScreen.main.bounds, controllers: [expansionCoordinator.navigationController, UIViewController()])
  }
}
