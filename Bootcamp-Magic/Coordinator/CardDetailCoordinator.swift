//
//  CardDetailCoordinator.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 24/02/21.
//

import UIKit

protocol CardDetailCoordinatorDelegate: AnyObject {
    func didDismiss()
}

protocol CardDetailCoordinatorProtocol: AnyObject {
    func dismiss()
}

class CardDetailCoordinator: Coordinatable {
    
    var currentViewController: UIViewController?
    var navigationController: UINavigationController
    private let viewModel: CardDetailViewModel
    weak var delegate: CardDetailCoordinatorDelegate?
    
    init(navigationController: UINavigationController,
         viewModel: CardDetailViewModel) {
        self.navigationController = navigationController
        self.viewModel = viewModel
    }
    
    func start() {
        let viewController = CardDetailViewController(viewModel: viewModel)
        viewController.modalPresentationStyle = .fullScreen
        viewController.coordinator = self
        currentViewController = viewController
        navigationController.present(viewController, animated: true, completion: nil)
    }
}

extension CardDetailCoordinator: CardDetailCoordinatorProtocol {
    func dismiss() {
        currentViewController?.dismiss(animated: true, completion: nil)
        delegate?.didDismiss()
    }
}
