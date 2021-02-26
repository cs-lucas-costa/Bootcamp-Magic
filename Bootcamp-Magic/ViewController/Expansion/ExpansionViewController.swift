//
//  ExpansionViewController.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 15/02/21.
//

import UIKit

final class ExpansionViewController: UIViewController {

  // MARK: - Properties
  let viewModel = ExpansionListViewModel()
  var expansions = [Expansion]()
  weak var navigationDelegate: ExpansionViewControllerNavigationDelegate?
  lazy var dataSource = ExpansionViewControllerDataSource(expansions: expansions)
  lazy var screen = ExpansionViewControllerScreen(frame: view.bounds)

  // MARK: - LoadView
  override func loadView() {
    super.loadView()
    view = screen
  }
    
  // MARK: - ViewWillAppear
  override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      navigationController?.navigationBar.isHidden = false
  }

  // MARK: - ViewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    setupNavigationTitle()
    fetchExpansions()
    viewModel.delegate = self
  }

  // MARK: - Methods
  func fetchExpansions() {
    self.screen.state = .fetching
    viewModel.fetchExpansions { [weak self] error in
      guard let self = self else { return }

      self.screen.state = .fetched

      if error == nil {

        for viewModels in self.viewModel.dictExpansions.map({ $0.value.map({ $0 }) }) {
          for viewModel in viewModels {
            self.expansions.append(Expansion(code: viewModel.code, name: viewModel.name))
          }
        }

        self.dataSource = ExpansionViewControllerDataSource(expansions: self.expansions, didSelectExpansion: { [weak self] expansion in
          guard let self = self else { return }
          self.navigationDelegate?.expansionSelected(expansion)
        })

        DispatchQueue.main.async { [weak self] in
          guard let self = self else { return }
          self.screen.tableView.delegate = self.dataSource
          self.screen.tableView.dataSource = self.dataSource
          self.screen.tableView.reloadData()
        }
      } else {
        print(error?.localizedDescription ?? "Error")
      }
    }
  }

  func setupNavigationTitle() {
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    navigationItem.title = Constants.String.Expansion.navigationTitle
  }

  func setupTableView() {
    screen.tableView.register(ExpansionTableViewCell.self, forCellReuseIdentifier: Constants.ExpasionTableViewCell.identifier)
    screen.tableView.delegate = dataSource
    screen.tableView.dataSource = dataSource
  }
    
    @objc func retryLoadData() {
        fetchExpansions()
        
        DispatchQueue.main.async { [weak self] in
            self?.view = self?.screen
        }
    }
}

extension ExpansionViewController: ErrorDidOccurDelegate {
    func errorDidOccur(error: String) {
        DispatchQueue.main.async { [weak self] in
            let errorHandlingView = ErrorHandlingView(error: error)
            
            errorHandlingView.retryButton.addTarget(self, action: #selector(self?.retryLoadData), for: .touchUpInside)
            self?.view = errorHandlingView
        }
    }
}
