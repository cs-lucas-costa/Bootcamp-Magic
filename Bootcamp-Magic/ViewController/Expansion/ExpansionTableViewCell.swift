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
  let horizontalMargin = CGFloat(16)
  let verticalMargin = CGFloat(5)
  
  // MARK: - Init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Extensions
  func setupCell(with expansion: Expansion) {
    expasionName.text = expansion.name
  }
  
  func hideDivisor() {
    horizontalDivisor.isHidden = true
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
      make.bottom.equalToSuperview()
      make.left.equalToSuperview().offset(horizontalMargin)
      make.right.equalToSuperview().inset(horizontalMargin)
      make.height.equalToSuperview().multipliedBy(0.05)
    }
    
    rightChevronImage.snp.makeConstraints { make in
      make.right.equalToSuperview().inset(horizontalMargin)
      make.width.equalToSuperview().multipliedBy(0.024)
      make.height.equalToSuperview().multipliedBy(0.24)
      make.centerY.equalToSuperview()
    }
    
    expansionImage.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(horizontalMargin)
      make.width.equalToSuperview().multipliedBy(0.1)
      make.top.equalToSuperview().offset(verticalMargin)
      make.bottom.equalToSuperview().inset(verticalMargin)
    }
    
    expasionName.snp.makeConstraints { make in
      make.left.equalTo(expansionImage.snp.right).offset(horizontalMargin)
      make.right.equalTo(rightChevronImage.snp.left)
      make.top.equalToSuperview().offset(verticalMargin)
      make.bottom.equalToSuperview().inset(verticalMargin)
    }
  }
  
  func setupAdditionalConfiguration() {
    expasionName.textAlignment = .left
    expasionName.textColor = .white
    horizontalDivisor.backgroundColor = .white
    backgroundColor = .clear
    expansionImage.contentMode = .scaleAspectFit
    rightChevronImage.contentMode = .scaleAspectFit
  }
}
