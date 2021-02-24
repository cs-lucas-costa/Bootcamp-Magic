//
//  CardDetailViewControllerProtocol.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 22/02/21.
//

import UIKit

protocol CardDetailViewControllerProtocol: UIViewController,
                                           CardDetailViewModelDelegate,
                                           DidDisplayCellDelegate, CardDetailViewDelegate {
    
    var cardDetailView: CardDetailView { get }
    var collectionViewDelegate: CardDetailCollectionViewDelegate? { get set }
    var collectionViewDataSource: CardDetailCollectionViewDataSource? { get set }
    var viewModel: CardDetailViewModel { get }
    var delegate: CardDetailToggleButtonDelegate? { get set }

    func setup()
    func setupDelegates()
    func setupDataSources()
    func setupLabels()
}

extension CardDetailViewControllerProtocol {
    
    func setupDataSources() {
        collectionViewDataSource = CardDetailCollectionViewDataSource(cardsPaths: viewModel.sendCards())
        cardDetailView.detailCollectionView.dataSource = collectionViewDataSource
    }
    
    func setupDelegates() {
        collectionViewDelegate = CardDetailCollectionViewDelegate(superView: self.view, cards: viewModel.sendCards())
        cardDetailView.detailCollectionView.delegate = collectionViewDelegate
        cardDetailView.delegate = self
        
        collectionViewDelegate?.delegate = self
        viewModel.delegate = self
        delegate = cardDetailView.favoriteButton
        
    }
    
    func setupLabels() {
        cardDetailView.expansionNameLabel.text = self.viewModel.sendFirtsExpansionName()
    }
    
    func setupButton() {
        cardDetailView.favoriteButton.addTarget(viewModel, action: #selector(viewModel.setToFavorite), for: .touchUpInside)
    }
    
    func setup() {
        setupDelegates()
        setupDataSources()
        setupLabels()
        setupButton()
    }
}

extension CardDetailViewControllerProtocol {

    func updateUI() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.cardDetailView.expansionNameLabel.text = self.viewModel.sendExpansionName()
            let actualCard = self.viewModel.sendActualCard()
            self.delegate?.didChangeCard(isFavorite: actualCard.isFavorite)
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

// MARK: CardDetailViewControllerProtocol
extension CardDetailViewControllerProtocol {
    func dismiss() {
       dismiss(animated: true, completion: nil)
    }
}
