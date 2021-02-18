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
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    func start() {
        currentViewController = expansionViewController
        navigationController.pushViewController(expansionViewController, animated: true)
    }
}


