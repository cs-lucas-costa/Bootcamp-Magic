//
//  ExpansionViewController.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 15/02/21.
//

import UIKit

final class ExpansionViewController: UIViewController {
  
  // MARK: - Properties
  lazy var dataSource = ExpansionViewControllerDataSource(expansions: expansion)
  lazy var screen = ExpansionViewControllerScreen(frame: view.bounds)
  let expansion = [Expansion(code: "", name: "Alpha"),
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
  
  // MARK: - ViewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    setupNavigationTitle()
  }
  
  // MARK: - Methods
  func setupNavigationTitle() {
    #warning("remover string hardcoded")
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    navigationItem.title = "Events"
  }
  
  func setupTableView() {
    screen.tableView.register(ExpansionTableViewCell.self, forCellReuseIdentifier: Constants.ExpasionTableViewCell.identifier)
    screen.tableView.delegate = dataSource
    screen.tableView.dataSource = dataSource
  }
}

