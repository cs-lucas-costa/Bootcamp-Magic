//
//  ExpansionViewModel.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 15/02/21.
//

import Foundation

class ExpansionViewModel {
    
    private let expansion: Expansion
    
    init(expansion: Expansion) {
        self.expansion = expansion
    }
    
    var name: String {
        expansion.name
    }
    
    var code: String {
        expansion.code
    }
}
