//
//  NavigationMenuTabBarController.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 16/02/21.
//

import UIKit
import SnapKit

//final class NavigationMenuTabBarController: UI
final class NavigationMenuTabBarController: UITabBarController {
  
  // MARK: - Properties
  let customTabBar: TabNavigationMenu
  #warning("Remover número mágico")
  let customTabBarHeight = CGFloat(70)
  
  // MARK: - Init
  init(frame: CGRect) {
    self.customTabBar = TabNavigationMenu(frame: frame)
  
    super.init(nibName: nil, bundle: nil)
    
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

// MARK: - ViewCodable Extension
extension NavigationMenuTabBarController: ViewCodable {
  func buildViewHierarchy() {
    view.addSubview(customTabBar)
  }
  
  func setupConstraints() {
    customTabBar.snp.makeConstraints { make in
      make.left.bottom.right.equalTo(view.safeAreaLayoutGuide)
      make.height.equalTo(customTabBarHeight)
    }
  }
  
  func setupAdditionalConfiguration() {
    UITabBar.appearance().backgroundColor = .clear
    UITabBar.appearance().backgroundImage = UIImage().withTintColor(.clear)
  }
  
}
