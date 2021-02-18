//
//  ExpansionCoordinator.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 17/02/21.
//

import UIKit

final class ExpansionCoordinator: Coordinatable {

  // MARK: - Properties
  var currentViewController: UIViewController?
  let expansionViewController = ExpansionViewController()

  func start() {
    let navigationController = UINavigationController()
    navigationController.pushViewController(expansionViewController, animated: true)
    currentViewController = navigationController
  }
}
