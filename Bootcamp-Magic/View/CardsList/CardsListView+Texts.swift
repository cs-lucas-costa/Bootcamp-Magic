//
//  CardsListView+Texts.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 18/02/21.
//

import Foundation

extension CardsListView {
    enum Texts {
        case searchForCards
        case searchForFavorites
        
        var text: String {
            switch self {
            case .searchForCards:
                return "Search for cards"
            case .searchForFavorites:
                return "Search for favorites"
            }
        }
    }
}
