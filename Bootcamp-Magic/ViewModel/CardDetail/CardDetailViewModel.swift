//
//  CardDetailViewModel.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 18/02/21.
//

import Foundation
import UIKit

final class CardDetailViewModel {

    weak var delegate: CardDetailViewModelDelegate?

    private var expansionCards: [CardViewModel]

    private var expansionName: String = "" {
        didSet {
            delegate?.updateUI()
        }
    }
    
    private(set) var actualIndex: Int = 0 {
        didSet {
            expansionName = expansionCards[actualIndex].name
        }
    }

    init(expansionCards: [CardViewModel]) {
        self.expansionCards = expansionCards
    }

    func setExpansionIndex(index: Int) {
        self.actualIndex = index
    }

    func sendCards() -> [CardViewModel] {
        expansionCards
    }
    
    func sendFirtsExpansionName() -> String {
        expansionCards[actualIndex].name
    }

    func sendExpansionName() -> String {
        expansionName
    }
    
    func sendExpansionIndex() -> Int {
        actualIndex
    }
    
    #warning("Implementar o método")
    @objc func setToFavorite() {
        print("Favoritou")
    }
    
}
