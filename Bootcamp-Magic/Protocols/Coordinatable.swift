//
//  Coordinatable.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 15/02/21.
//

import UIKit

protocol Coordinatable: AnyObject {
    var currentViewController: UIViewController? { get set }
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinatable] { get set }
    
    func start()
    func removeChild()
}

extension Coordinatable {
        
    func removeChild() {
        if !childCoordinators.isEmpty {
            childCoordinators.removeLast()
        }
    }
    
}
