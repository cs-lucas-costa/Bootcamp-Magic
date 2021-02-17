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
  let expasion = [Expansion(code: "", name: "Alpha"),
                  Expansion(code: "", name: "Alliances"),
                  Expansion(code: "", name: "Beta"),
                  Expansion(code: "", name: "Betrayers of Kamigawa"),
                  Expansion(code: "", name: "Champions of Kamigawa"),
                  Expansion(code: "", name: "Coldsnap"),
                  Expansion(code: "", name: "Darksteel")]
  
  
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

