//
//  TabNavigationMenu.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 16/02/21.
//

import UIKit

final class TabNavigationMenu: UIView {
  
  // MARK: - Inits
  convenience init(menuItems: [TabItem] = [.expansions, .favorites], frame: CGRect) {
    self.init(frame: frame)
  }
}

// MARK: - ViewCodable Extension
extension TabNavigationMenu: ViewCodable {
  func buildViewHierarchy() {
    
  }
  
  func setupConstraints() {
    
  }
  
  func setupAdditionalConfiguration() {
    
  }
}
