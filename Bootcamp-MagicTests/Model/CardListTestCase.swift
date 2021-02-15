//
//  CardListTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 15/02/21.
//

import XCTest
@testable import Bootcamp_Magic


class CardListTestCase: XCTestCase {

    func testDecodeCardList() throws {
        let data = try readJSONFile()
        let list = try JSONDecoder().decode(CardList.self, from: data)
        
        XCTAssertEqual(list.cards.count, 2)
    }
    
    //MARK: Auxiliary methods
    func readJSONFile() throws -> Data {
        let bundle = Bundle(for: type(of: self))
        let path = try XCTUnwrap(bundle.url(forResource: "cards", withExtension: "json"))
        return try Data(contentsOf: path)
    }

}
