//
//  CardsListViewState.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 18/02/21.
//

import Foundation

enum CardsListViewState {
    case favorites
    case all(expansion: ExpansionViewModel)
}

extension CardsListViewState: Equatable {
    static func == (lhs: CardsListViewState, rhs: CardsListViewState) -> Bool {
        switch (lhs, rhs) {
        case (.all(let lhsExpansions), .all(let rhsExpansions)):
            return lhsExpansions === rhsExpansions
        case (.favorites, .favorites):
            return true
        default:
            return false
        }
    }
}
