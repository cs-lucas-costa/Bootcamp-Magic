//
//  CardDetailViewController.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 18/02/21.
//

import Foundation
import UIKit

final class CardDetailViewController: UIViewController, CardDetailViewControllerProtocol {
    
    var cardDetailView: CardDetailView
    
    var collectionViewDelegate: CardDetailCollectionViewDelegate?
    
    var collectionViewDataSource: CardDetailCollectionViewDataSource?
    
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
    
    override func viewDidLoad() {
        setup()
        
        super.viewDidLoad()
    }
}
