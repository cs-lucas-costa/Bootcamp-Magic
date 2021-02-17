//
//  ViewCodable.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 15/02/21.
//

import Foundation

protocol ViewCodable {
  func buildViewHierarchy()
  func setupConstraints()
  func setupAdditionalConfiguration()
  func setupView()
}

extension ViewCodable {
  func setupView() {
    buildViewHierarchy()
    setupConstraints()
    setupAdditionalConfiguration()
  }
}
