//
//  ExpansionViewController.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 15/02/21.
//

import UIKit

final class ExpansionViewController: UIViewController {
  
  // MARK: - Properties
  let dataSource = ExpansionViewControllerDataSource()
  lazy var screen = ExpansionViewControllerScreen(frame: view.bounds)
  
  
  // MARK: - LoadView
  override func loadView() {
    super.loadView()
    view = screen
  }
  
  // MARK: - Methods
  func setupTableView() {
    screen.tableView.delegate = dataSource
    screen.tableView.dataSource = dataSource
  }
}

