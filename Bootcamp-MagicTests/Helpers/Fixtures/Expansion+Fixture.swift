//
//  Expansion+Fixture.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 15/02/21.
//

import Foundation
@testable import Bootcamp_Magic

extension Expansion {

    static func fixture(
        name: String = "Tenth Edition",
        code: String = "10E") -> Self {

        .init(code: code, name: name)
    }

}

extension ExpansionList {

    static func fixture() throws -> Self {
        try JSONDecoder().decode(ExpansionList.self, from: data)
    }

    private static var data: Data {

        Data("""
        {
            "sets": [
                {
                    "code": "10E",
                    "name": "Tenth Edition",
                },
                {
                    "code": "2ED",
                    "name": "Unlimited Edition",
                },
                {
                    "code": "2ED",
                    "name": "Unlimited Edition",
                }
            ]
        }
        """.utf8)
    }
}
