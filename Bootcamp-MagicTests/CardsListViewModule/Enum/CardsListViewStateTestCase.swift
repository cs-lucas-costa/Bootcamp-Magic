//
//  CardsListViewStateTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 19/02/21.
//

import XCTest
@testable import Bootcamp_Magic

class CardsListViewStateTestCase: XCTestCase {
    
    func testStateAllIsEqual() {
        
        let expansion = ExpansionViewModel(expansion: .fixture())
        
        let state1: CardsListViewState = .all(expansion: expansion)
        let state2: CardsListViewState = .all(expansion: expansion)
        
        XCTAssertEqual(state1, state2)
    }
    
}
