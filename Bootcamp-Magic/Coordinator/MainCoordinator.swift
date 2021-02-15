//
//  MainCoordinator.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 15/02/21.
//

import UIKit

final class MainCoordinator: Coordinatable {
  
  // MARK: - Properties
  let navigationController: UINavigationController
  
  // MARK: - Init
  init(navigationController: UINavigationController) {
    print(#function)
    self.navigationController = navigationController
  }

  func start() {
    print(#function)
    let expansionViewController = ExpansionViewController()
    navigationController.pushViewController(expansionViewController, animated: true)
  }
}
