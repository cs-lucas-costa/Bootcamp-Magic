//
//  CardsListCoordinator.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 18/02/21.
//

import UIKit

protocol CardsListCoordinatorProtocol: AnyObject {
    func showCardDetail(_ cards: [CardViewModel])
    func dismiss()
}
