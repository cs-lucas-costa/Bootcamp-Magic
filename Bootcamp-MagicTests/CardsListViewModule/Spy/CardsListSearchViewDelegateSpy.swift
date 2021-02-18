//
//  CardsListSearchViewDelegateSpy.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 18/02/21.
//

import Foundation

@testable import Bootcamp_Magic

class CardsListSearchViewDelegateSpy: CardsListSearchViewDelegate {
    
    var isCancelSearch: Bool = false
    var isChangeText: Bool = false
    
    func textDidChange(_ text: String) {
        isChangeText = true
    }
    
    func didCancelSearch() {
        isCancelSearch = true
    }

}
