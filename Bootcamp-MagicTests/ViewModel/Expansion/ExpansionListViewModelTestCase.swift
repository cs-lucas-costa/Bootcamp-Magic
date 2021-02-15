//
//  ExpansionListViewModelTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 15/02/21.
//

import XCTest
@testable import Bootcamp_Magic

class ExpansionListViewModelTestCase: XCTestCase {


    func testCreateDictExpansion() throws {
        
        let list = try ExpansionList.fixture()
        let sut = ExpansionListViewModel(list: list)
        
        XCTAssertEqual(sut.dictExpansions.keys.count, 2)
        XCTAssertEqual(sut.dictExpansions["U"]?.count, 2)
    }
    
}
