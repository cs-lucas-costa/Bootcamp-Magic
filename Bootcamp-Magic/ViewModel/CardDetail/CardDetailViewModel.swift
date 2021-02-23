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

    private let networkManager: NetworkManager

    private var expansionCards: [CardViewModel]

    private var expansionName: String = "" {
        didSet {
            delegate?.updateUI()
        }
    }

    private lazy var imagesPath: [String] = {
        return self.expansionCards.compactMap { $0.imageUrl }
    }()
    
    var actualIndex: Int = 0 {
        didSet {
            expansionName = expansionCards[actualIndex].name
        }
    }

    init(networkManager: NetworkManager, expansionCards: [CardViewModel]) {
        self.networkManager = networkManager
        self.expansionCards = expansionCards
    }

    func setExpansionIndex(index: Int) {
        self.actualIndex = index
    }
    
    func sendImagesPath() -> [String] {
        imagesPath
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
    
}
