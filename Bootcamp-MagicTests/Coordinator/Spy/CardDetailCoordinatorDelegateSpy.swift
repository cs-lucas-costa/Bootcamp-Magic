//
//  CardDetailCoordinatorDelegateSpy.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 25/02/21.
//

import Foundation

@testable import Bootcamp_Magic

class CardDetailCoordinatorDelegateSpy: CardDetailCoordinatorDelegate {
    
    var isDismissed: Bool = false
    
    func didDismiss() {
        isDismissed = true
    }
    
}
