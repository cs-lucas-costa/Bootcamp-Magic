//
//  ExpansionViewControllerDataSource.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 16/02/21.
//

import UIKit

final class ExpansionViewControllerDataSource: NSObject { }

// MARK: - UITableViewDataSource
extension ExpansionViewControllerDataSource: UITableViewDataSource {
    
  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
}

// MARK: - UITableViewDelegate
extension ExpansionViewControllerDataSource: UITableViewDelegate { }

