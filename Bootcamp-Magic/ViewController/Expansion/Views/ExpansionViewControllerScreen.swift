//
//  ExpansionViewControllerScreen.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 16/02/21.
//

import UIKit

final class ExpansionViewControllerScreen: UIView {

  enum State {
    case fetching
    case fetched
  }

  // MARK: - Properties
  let tableView = UITableView(frame: .zero)
  let backgroundImage = UIImageView(frame: .zero)
  let activityIndicator = UIActivityIndicatorView(frame: .zero)
  var state = State.fetching {
    didSet {
      change(to: state)
    }
  }
  
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func showActivityIndicator() {
    DispatchQueue.main.async { [weak self] in
      guard let self = self else { return }
      self.activityIndicator.startAnimating()
    }
  }

  private func hideActivityIndicator() {
    DispatchQueue.main.async { [weak self] in
      guard let self = self else { return }
      self.activityIndicator.stopAnimating()
    }
  }

  fileprivate func change(to state: ExpansionViewControllerScreen.State) {
      switch state {
      case .fetching:
        showActivityIndicator()
      case .fetched:
        hideActivityIndicator()
      }
    }
}

// MARK: - ViewCodable Extension
extension ExpansionViewControllerScreen: ViewCodable {
  func buildViewHierarchy() {
    addSubview(backgroundImage)
    addSubview(tableView)
    addSubview(activityIndicator)
  }

  func setupConstraints() {

    backgroundImage.snp.makeConstraints { make in
      make.left.right.bottom.top.equalToSuperview()
    }

    activityIndicator.snp.makeConstraints { make in
      make.top.left.right.bottom.equalTo(safeAreaLayoutGuide)
    }

    tableView.snp.makeConstraints { make in
      make.top.left.right.bottom.equalToSuperview()
    }
  }

  func setupAdditionalConfiguration() {
    backgroundImage.image = Constants.Images.backgroundImage

    tableView.backgroundColor = .clear
    bringSubviewToFront(tableView)

    activityIndicator.color = .white
    activityIndicator.style = .large
    bringSubviewToFront(activityIndicator)
  }
}
