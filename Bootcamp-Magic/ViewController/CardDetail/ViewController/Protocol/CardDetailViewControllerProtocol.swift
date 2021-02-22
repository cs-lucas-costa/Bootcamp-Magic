//
//  CardDetailViewControllerProtocol.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 22/02/21.
//

import UIKit

protocol CardDetailViewControllerProtocol: UIViewController,
                                          CardsListSearchViewDelegate,
                                          CardsListViewDelegate {
    
    var cardsListView: CardsListView { get }
    var cardDetailDelegate: CardDetailCollectionViewDelegate? { get set }
    var collectionViewDataSource: CardDetailCollectionViewDataSource? { get set }
    var viewModel: CardDetailViewModel { get }
    
    func setupDelegates()
    func setupDataSources()
    func setupClosures()    
}
