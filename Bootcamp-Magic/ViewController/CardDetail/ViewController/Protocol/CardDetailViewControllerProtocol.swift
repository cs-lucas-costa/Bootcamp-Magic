//
//  CardDetailViewControllerProtocol.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 22/02/21.
//

import UIKit

protocol CardDetailViewControllerProtocol: UIViewController, CardDetailViewModelDelegate, DidDisplayCellDelegate {
    
    var cardDetailView: CardDetailView { get }
    var collectionViewDelegate: CardDetailCollectionViewDelegate? { get set }
    var collectionViewDataSource: CardDetailCollectionViewDataSource? { get set }
    var viewModel: CardDetailViewModel { get }
    
    func setup()
    func setupDelegates()
    func setupDataSources()
    func setupLabels()
}

extension CardDetailViewControllerProtocol {
    
    func setupDataSources() {
        collectionViewDataSource = CardDetailCollectionViewDataSource(cardsPaths: viewModel.sendImagesPath())
        cardDetailView.detailCollectionView.dataSource = collectionViewDataSource
    }
    
    func setupDelegates() {
        collectionViewDelegate = CardDetailCollectionViewDelegate(superView: self.view, cards: viewModel.sendCards())
        cardDetailView.detailCollectionView.delegate = collectionViewDelegate
        
        collectionViewDelegate?.delegate = self
        viewModel.delegate = self
        
    }
    
    func setupLabels() {
        cardDetailView.expansionNameLabel.text = self.viewModel.sendFirtsExpansionName()
    }
    
    func setup() {
        setupDelegates()
        setupDataSources()
        setupLabels()
    }
}

extension CardDetailViewControllerProtocol {

    func updateUI() {
        DispatchQueue.main.async { [weak self] in
            self?.cardDetailView.expansionNameLabel.text = self?.viewModel.sendExpansionName()
        }
    }
}

extension CardDetailViewControllerProtocol {
    func didOffsetChanged(offset: CGFloat, toPrevious: Bool) {

        let previousOffset: CGFloat = toPrevious ? self.cardDetailView.detailCollectionView.frame.size.width * 0.7 : 0
        let contentIndex = Int(ceil((offset - previousOffset) / self.cardDetailView.detailCollectionView.frame.size.width))
        let cardsCount: Int = viewModel.sendCards().count

        let index = contentIndex < cardsCount ? contentIndex : cardsCount - 1

        self.cardDetailView.detailCollectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
        viewModel.setExpansionIndex(index: index)
    }
}
