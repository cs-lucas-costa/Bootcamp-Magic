//
//  ExpansionTableViewCell.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 16/02/21.
//

import UIKit
import SnapKit

final class ExpansionTableViewCell: UITableViewCell {
  
  // MARK: - Properties
  let expansionImage = UIImageView(frame: .zero)
  let expasionName = UILabel(frame: .zero)
  #warning("Remover string hardcoded")
  let rightChevronImage = UIImageView(image: Constants.Images.rightChevron)
  let horizontalDivisor = UIView(frame: .zero)
  let margin = CGFloat(16)
  
  // MARK: - Init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension ExpansionTableViewCell: ViewCodable {
  func buildViewHierarchy() {
    addSubview(expansionImage)
    addSubview(expasionName)
    addSubview(rightChevronImage)
    addSubview(horizontalDivisor)
  }
  
  func setupConstraints() {
    #warning("remover números mágicos")
    
    horizontalDivisor.snp.makeConstraints { make in
      make.bottom.centerX.equalToSuperview()
      make.width.equalToSuperview().multipliedBy(0.8)
      make.height.equalToSuperview().multipliedBy(0.05)
    }
    
    rightChevronImage.snp.makeConstraints { make in
      make.right.equalToSuperview().inset(margin)
      make.centerY.equalToSuperview()
    }
    
    expansionImage.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(margin)
      make.centerY.equalToSuperview()
    }
    
    expasionName.snp.makeConstraints { make in
      make.left.equalTo(expansionImage.snp.right)
      make.right.equalTo(rightChevronImage.snp.left)
      make.centerY.equalToSuperview()
    }
  }
  
  func setupAdditionalConfiguration() {
    horizontalDivisor.backgroundColor = .white
  }
}
