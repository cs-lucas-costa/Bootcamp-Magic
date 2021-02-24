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
    private var dataBaseManager: DatabaseProtocol
    
    init(card: Card, networkManager: NetworkManager, dataBaseManager: DatabaseProtocol) {
        self.card = card
        self.networkManager = networkManager
        self.dataBaseManager = dataBaseManager
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
    
    var isFavorite: Bool = false
    
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
    
    func update() {
        if isFavorite {
            deleteFromDataBase()
        } else {
            saveOnDataBase()
        }
    }
    
    private func saveOnDataBase() {
        dataBaseManager.create(element: card) { [weak self] result in
            switch result {
            case .success:
                self?.isFavorite = true
            case .failure:
                self?.isFavorite = false
            }
        }
    }
    
    private func deleteFromDataBase() {
        dataBaseManager.delete(element: card) { [weak self] error in
            guard error == nil else {
                return
            }
            self?.isFavorite = false
        }
    }
 
}
