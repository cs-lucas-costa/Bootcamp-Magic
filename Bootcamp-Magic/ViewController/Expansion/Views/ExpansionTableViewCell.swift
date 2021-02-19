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
  let rightChevronImage = UIImageView(image: Constants.Images.rightChevron)
  let horizontalDivisor = UIView(frame: .zero)
  let horizontalMargin = Constants.Margin.Expasion.horizontalMargin
  let verticalMargin = Constants.Margin.Expasion.verticalMargin

  // MARK: - Init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Extensions
  func setupCell(with expansion: Expansion, image: UIImage? = nil) {
    expasionName.text = expansion.name

    if image != nil {
      addExpansionImageOnView()
    } else {
      removeExpansionImageFromView()
    }
  }

  private func removeExpansionImageFromView() {
    expansionImage.isHidden = true
    expasionName.snp.removeConstraints()
    expasionName.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(horizontalMargin)
      make.right.equalTo(rightChevronImage.snp.left)
      make.top.equalToSuperview().offset(verticalMargin)
      make.bottom.equalToSuperview().inset(verticalMargin)
    }
  }

  private func addExpansionImageOnView() {
    expansionImage.isHidden = false
    expasionName.snp.removeConstraints()
    expasionName.snp.makeConstraints { make in
      make.left.equalTo(expansionImage.snp.right).offset(horizontalMargin)
      make.right.equalTo(rightChevronImage.snp.left)
      make.top.equalToSuperview().offset(verticalMargin)
      make.bottom.equalToSuperview().inset(verticalMargin)
    }
  }

  func hideDivisor() {
    horizontalDivisor.isHidden = true
  }

  func showDivisor() {
    horizontalDivisor.isHidden = false
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

    horizontalDivisor.snp.makeConstraints { make in
      let heightMultiplier = CGFloat(0.05)
      make.bottom.equalToSuperview()
      make.left.equalToSuperview().offset(horizontalMargin)
      make.right.equalToSuperview().inset(horizontalMargin)
      make.height.equalToSuperview().multipliedBy(heightMultiplier)
    }

    rightChevronImage.snp.makeConstraints { make in
      let widthMultiplier = CGFloat(0.024)
      let heightMultiplier = CGFloat(0.24)
      make.right.equalToSuperview().inset(horizontalMargin)
      make.width.equalToSuperview().multipliedBy(widthMultiplier)
      make.height.equalToSuperview().multipliedBy(heightMultiplier)
      make.centerY.equalToSuperview()
    }

    expansionImage.snp.makeConstraints { make in
      let widthMultiplier = CGFloat(0.024)
      make.left.equalToSuperview().offset(horizontalMargin)
      make.width.equalToSuperview().multipliedBy(widthMultiplier)
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
    expasionName.font = UIFont.systemFont(ofSize: Constants.FontSize.default, weight: .bold)
    expasionName.textAlignment = .left
    expasionName.textColor = .white

    horizontalDivisor.backgroundColor = .white

    expansionImage.contentMode = .scaleAspectFit

    rightChevronImage.contentMode = .scaleAspectFit

    backgroundColor = .clear
  }
}
