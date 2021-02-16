//
//  TabItem.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 16/02/21.
//

import UIKit

enum TabItem: CaseIterable {
  case expansion
  case favorites
  
  var title: String {
    switch self {
    #warning("Remover string fixas")
    case .expansion: return "Expansions"
    case .favorites: return "Favorites"
    }
  }
  
  var type: UIViewController.Type {
    switch self {
    case .expansion: return ExpansionViewController.self
    case .favorites: return UIViewController.self
    }
  }
}
