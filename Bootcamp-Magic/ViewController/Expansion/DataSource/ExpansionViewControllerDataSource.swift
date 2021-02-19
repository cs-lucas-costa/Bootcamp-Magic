//
//  ExpansionViewControllerDataSource.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 16/02/21.
//

import UIKit

final class ExpansionViewControllerDataSource: NSObject {

  // MARK: - Properties
  let expansions: [Expansion]
  let initials: [Character]
  let heightMultiplier = CGFloat(0.08)
  let didSelectExpansion: ((Expansion) -> Void)?

  // MARK: - Init
  init(expansions: [Expansion], didSelectExpansion: ((Expansion) -> Void)? = nil) {
    self.expansions = expansions
    self.initials = expansions.map({ $0.name[0] }).unique(for: \.self)
    self.didSelectExpansion = didSelectExpansion
  }
}

// MARK: - UITableViewDataSource
extension ExpansionViewControllerDataSource: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    return initials.count
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return expansions.filter({ $0.name[0] == initials[section] }).count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ExpasionTableViewCell.identifier, for: indexPath) as? ExpansionTableViewCell else {
      preconditionFailure("Cell must be of type \(ExpansionTableViewCell.self)")
    }

    let expansion = expansions.filter({ $0.name[0] == initials[indexPath.section] })[indexPath.row]

    cell.setupCell(with: expansion)

    return cell
  }
}

// MARK: - UITableViewDelegate
extension ExpansionViewControllerDataSource: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let expansion = expansions.filter({ $0.name[0] == initials[indexPath.section] })[indexPath.row]
    didSelectExpansion?(expansion)
  }

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = ExpansionHeaderView(frame: CGRect(origin: .zero, size: CGSize(width: tableView.frame.size.width, height: 0)), character: initials[section])

    return header
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let height = UIScreen.main.bounds.size.height * heightMultiplier
    return height
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    let height = UIScreen.main.bounds.size.height * heightMultiplier
    return height
  }

  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

    guard let cell = cell as? ExpansionTableViewCell else {
      preconditionFailure("Cell must be of type \(ExpansionTableViewCell.self)")
    }

    let section = indexPath.section
    let rowsAmount = tableView.numberOfRows(inSection: section)

    // Last row of section
    if (indexPath.row == rowsAmount - 1) {
      // If it's the last section it should have a divisor
      let sectionsAmount = tableView.numberOfSections
      guard section != sectionsAmount - 1 else {
        cell.showDivisor()
        return
      }
      cell.hideDivisor()
    } else {
      cell.showDivisor()
    }
  }
}
