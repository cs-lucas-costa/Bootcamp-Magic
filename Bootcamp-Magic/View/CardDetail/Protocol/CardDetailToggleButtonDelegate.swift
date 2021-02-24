//
//  CardDetailToggleButtonDelegate.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 24/02/21.
//

import Foundation

protocol CardDetailToggleButtonDelegate: AnyObject {
    func didChangeCard(isFavorite: Bool)
}
