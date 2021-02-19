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
    case .expansion: return Constants.String.TabBar.expansion
    case .favorites: return Constants.String.TabBar.favorites
    }
  }
}
