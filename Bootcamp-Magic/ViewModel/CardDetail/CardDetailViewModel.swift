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

    private var expansionCards: [Card]

    private var expansionName: String = "" {
        didSet {
            delegate?.updateUI()
        }
    }

    private var cardsImages: [UIImage?] = []

    private lazy var imagesPath: [String] = {
        return self.expansionCards.map { $0.imageUrl }
    }()

    init(networkManager: NetworkManager, expansionCards: [Card]) {
        self.networkManager = networkManager
        self.expansionCards = expansionCards
        getCardsImages()
    }

    private func getCardsImages() {

        cardsImages = imagesPath.map { (imagePath) -> UIImage? in

            var recoveredImage : UIImage?

            networkManager.getImageFromURL(imagesService: .cardImage(imagePath: imagePath)) { result in
                switch result {
                case .success(let image):
                    recoveredImage = image
                case .failure:
                    recoveredImage = nil
                }
            }

            return recoveredImage
        }
    }

    func getExpansionName(index: Int) {
        self.expansionName = expansionCards[index].name
    }

    func sendCards() -> [Card] {
        expansionCards
    }

    func sendCardsImage() -> [UIImage] {

        let guardedImagesArray = cardsImages.map { image -> UIImage in

            if let guardedImage = image {
                return guardedImage
            } else {
                return UIImage()
            }
        }

        return guardedImagesArray
    }

    func sendExpansionName() -> String {
        expansionName
    }
}
