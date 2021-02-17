//
//  Coordinatable.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 15/02/21.
//

import UIKit

protocol Coordinatable: AnyObject {
  var currentViewController: UIViewController? { get set }
  func start()
}
