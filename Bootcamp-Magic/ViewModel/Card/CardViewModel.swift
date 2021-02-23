//
//  CardViewModel.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 16/02/21.
//

import UIKit

final class CardViewModel {

    private let card: Card
    private let networkManager: NetworkManager
    
    init(card: Card, networkManager: NetworkManager) {
        self.card = card
        self.networkManager = networkManager
    }

    var name: String {
        card.name
    }

    var type: String {
        card.type
    }
    
    var imageUrl: String? {
        card.imageUrl
    }
    
    private var cardImage: UIImage?
    
    func fetchCards(completion: @escaping (UIImage?) -> Void) {
        
        guard cardImage == nil else {
            completion(cardImage)
            return
        }
        
        guard let url = card.imageUrl else {
            completion(nil)
            return
        }
        
        networkManager.getImageFromURL(imagesService: .cardImage(imagePath: url)) { [weak self] result in
            switch result {
            case .success(let image):
                self?.cardImage = image
                completion(image)
            case .failure:
                completion(nil)
            }
        }
    }
 
}
