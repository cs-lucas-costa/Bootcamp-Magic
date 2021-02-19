//
//  ExpansionHeaderView.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 17/02/21.
//

import UIKit

final class ExpansionHeaderView: UIView {

  // MARK: - Properties
  let initialCharacterLabel = UILabel(frame: .zero)
  let margin = Constants.Margin.Expasion.horizontalMargin

  // MARK: - Init
  init(frame: CGRect, character: Character) {
    super.init(frame: frame)

    setupView()
    setupHeader(with: character)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Methods
  private func setupHeader(with character: Character) {
    initialCharacterLabel.text = character.uppercased()
  }

}

// MARK: - ViewCodable Methods
extension ExpansionHeaderView: ViewCodable {
  func buildViewHierarchy() {
    addSubview(initialCharacterLabel)
  }

  func setupConstraints() {
    initialCharacterLabel.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(margin)
      make.centerY.equalToSuperview()
      make.right.equalToSuperview().inset(margin)
    }
  }

  func setupAdditionalConfiguration() {
    initialCharacterLabel.textColor = .black
    initialCharacterLabel.font = UIFont.systemFont(ofSize: Constants.FontSize.default, weight: .bold)
    
    backgroundColor = .white
  }
}
