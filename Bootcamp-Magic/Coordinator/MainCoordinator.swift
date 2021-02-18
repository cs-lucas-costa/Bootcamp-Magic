//
//  MainCoordinator.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 15/02/21.
//

import UIKit

final class MainCoordinator: Coordinatable {

  // MARK: - Properties
  var currentViewController: UIViewController?
  let expasionCoordinator = ExpansionCoordinator()

  func start() {
    expasionCoordinator.start()

    guard let viewController = expasionCoordinator.currentViewController else {
      preconditionFailure("CurrentViewControllerffrom ExpasionCoordinator must exist")
    }

    currentViewController = NavigationMenuTabBarController(frame: UIScreen.main.bounds, controllers: [viewController, UIViewController()])
  }
}
