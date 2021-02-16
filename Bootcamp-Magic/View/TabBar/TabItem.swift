//
//  TabItem.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 16/02/21.
//

import UIKit

enum TabItem {
  case expansions
  case favorites
  
  var icon: UIImage {
    switch self {
    case .expansions: fatalError()
    case .favorites: fatalError()
    }
  }
}
