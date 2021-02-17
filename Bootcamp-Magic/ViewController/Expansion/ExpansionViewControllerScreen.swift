//
//  ExpansionViewControllerScreen.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 16/02/21.
//

import UIKit

final class ExpansionViewControllerScreen: UIView {
  
  // MARK: - Properties
  let tableView = UITableView(frame: .zero)
  let backgroundImage = UIImageView(frame: .zero)
  
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - ViewCodable Extension
extension ExpansionViewControllerScreen: ViewCodable {
  func buildViewHierarchy() {
    addSubview(backgroundImage)
    addSubview(tableView)
  }
  
  func setupConstraints() {

    backgroundImage.snp.makeConstraints { make in
      make.left.right.bottom.top.equalToSuperview()
    }
    
    tableView.snp.makeConstraints { make in
      make.top.left.right.bottom.equalToSuperview()
    }
  }
  
  func setupAdditionalConfiguration() {
    backgroundImage.image = Constants.Images.backgroundImage
    tableView.backgroundColor = .clear
    bringSubviewToFront(tableView)
  }
}
