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
  
  // MARK: - Init
  init(expansions: [Expansion]) {
    self.expansions = expansions
    self.initials = expansions.map({ $0.name[0] }).unique(for: \.self)
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
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    #warning("remover número mágico")
    
    let height = UIScreen.main.bounds.size.height * 0.0615
    let header = ExpansionHeaderView(frame: CGRect(origin: .zero, size: CGSize(width: tableView.frame.size.width, height: height)), character: initials[section])
    
    return header
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    #warning("remover número mágico")
    
    let height = UIScreen.main.bounds.size.height * 0.0615
    return height
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    #warning("remover número mágico")
    
    let height = UIScreen.main.bounds.size.height * 0.0615
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
        return
      }
      cell.hideDivisor()
    }
  }
}

