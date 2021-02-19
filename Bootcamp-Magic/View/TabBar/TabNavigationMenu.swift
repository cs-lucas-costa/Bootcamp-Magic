//
//  TabNavigationMenu.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 16/02/21.
//

import UIKit
import SnapKit

final class TabNavigationMenu: UIView {

  // MARK: - Properties
  let expansionButton = UIButton(type: .system)
  let favoritesButton = UIButton(type: .system)
  let verticalDivider = UIView(frame: .zero)
  let horizontalDivider = UIView(frame: .zero)

  // MARK: - Inits
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - ViewCodable Extension
extension TabNavigationMenu: ViewCodable {
  func buildViewHierarchy() {
    addSubview(expansionButton)
    addSubview(favoritesButton)
    addSubview(verticalDivider)
    addSubview(horizontalDivider)
  }

  func setupConstraints() {
    verticalDivider.snp.makeConstraints { make in
      let widthMultiplier = CGFloat(0.005)
      let heightMultiplier = CGFloat(0.8)
      make.width.equalToSuperview().multipliedBy(widthMultiplier)
      make.height.equalToSuperview().multipliedBy(heightMultiplier)
      make.centerX.equalToSuperview()
      make.bottom.equalToSuperview()
    }

    horizontalDivider.snp.makeConstraints { make in
      make.top.left.right.equalToSuperview()
      make.height.equalTo(verticalDivider.snp.width)
    }

    expansionButton.snp.makeConstraints { make in
      make.left.bottom.equalToSuperview()
      make.right.equalTo(verticalDivider.snp.left)
      make.top.equalTo(horizontalDivider.snp.bottom)
    }

    favoritesButton.snp.makeConstraints { make in
      make.centerY.equalTo(expansionButton.snp.centerY)
      make.left.equalTo(verticalDivider.snp.right)
      make.right.equalToSuperview()
    }
  }

  func setupAdditionalConfiguration() {
    expansionButton.setTitle(TabItem.expansion.title, for: .normal)
    expansionButton.setTitleColor(.white, for: .normal)
    expansionButton.titleLabel?.font = UIFont.systemFont(ofSize: Constants.FontSize.default, weight: .bold)

    favoritesButton.setTitle(TabItem.favorites.title, for: .normal)
    favoritesButton.setTitleColor(.white, for: .normal)
    favoritesButton.titleLabel?.font = UIFont.systemFont(ofSize: Constants.FontSize.default, weight: .bold)

    verticalDivider.backgroundColor = .white
    horizontalDivider.backgroundColor = .white
  }
}
