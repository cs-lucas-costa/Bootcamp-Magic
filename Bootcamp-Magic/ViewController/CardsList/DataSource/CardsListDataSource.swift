//
//  CardsListDataSource.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 17/02/21.
//

import UIKit

class CardsListDataSource: NSObject {
    
    typealias Filter = (isFiltering: Bool, word: String)
    
    private let dictCards: [Dict<String, [CardViewModel]>]
    private(set) var filteredCards: [Dict<String, [CardViewModel]>] = []
    
    var filter: Filter = (false, "") {
        didSet {
            if filter.isFiltering {
                filterCards(with: filter.word)
            }
        }
    }
    
    init(dictCards: [Dict<String, [CardViewModel]>]) {
        self.dictCards = dictCards
    }
    
    private func filterCards(with name: String) {        
        filteredCards = dictCards.compactMap {
            let cards = $0.value.filter { (card) -> Bool in
                return card.name.uppercased().contains(name.uppercased())
            }
        
            return cards.isEmpty ? nil : Dict(key: $0.key, value: cards)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension CardsListDataSource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        !filter.isFiltering ? dictCards.count : filteredCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        !filter.isFiltering ? dictCards[section].value.count : filteredCards[section].value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CardCollectionViewCell.identifier,
                for: indexPath) as? CardCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let card = !filter.isFiltering ?
            dictCards[indexPath.section].value[indexPath.item] :
            filteredCards[indexPath.section].value[indexPath.item]
        
        if let imageUrl = card.imageUrl {
            cell.imageView.downloadImage(with: imageUrl)
        }
        
        cell.setupView()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: CardsListHeaderView.identifier,
                    for: indexPath) as? CardsListHeaderView else {
                return UICollectionReusableView()
            }
            
            let title = !filter.isFiltering ?
                dictCards[indexPath.section].key :
                filteredCards[indexPath.section].key
            
            header.title = title
            header.setupView()
            return header
        }
        
        return UICollectionReusableView()
    }
}
