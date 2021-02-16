//
//  MainCoordinator.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 15/02/21.
//

import UIKit

final class MainCoordinator: Coordinatable {
  
  // MARK: - Properties
  var navigationMenuTabBarController: NavigationMenuTabBarController?

  func start() {
    print(#function)
    navigationMenuTabBarController = NavigationMenuTabBarController(frame: UIScreen.main.bounds, controllers: [ExpansionViewController(), UIViewController()])
  }
}
