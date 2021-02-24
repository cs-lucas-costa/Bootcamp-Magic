//
//  CardDetailViewController.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 18/02/21.
//

import Foundation
import UIKit

final class CardDetailViewController: UIViewController, CardDetailViewControllerProtocol {
    
    weak var delegate: CardDetailToggleButtonDelegate?
    var cardDetailView: CardDetailView
    var collectionViewDelegate: CardDetailCollectionViewDelegate?
    var collectionViewDataSource: CardDetailCollectionViewDataSource?
    weak var coordinator: CardDetailCoordinatorProtocol?
    
    var viewModel: CardDetailViewModel
    
    init(viewModel: CardDetailViewModel) {
        self.viewModel = viewModel
        self.cardDetailView = CardDetailView()
        
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = cardDetailView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let indexPath = IndexPath(item: self.viewModel.actualIndex, section: 0)
            self.cardDetailView.detailCollectionView.scrollToItem(at: indexPath,
                                                             at: .centeredHorizontally, animated: false)
            self.viewModel.delegate?.updateUI()
        }
    }
    
    override func viewDidLoad() {
        setup()
        super.viewDidLoad()
    }
    
}
