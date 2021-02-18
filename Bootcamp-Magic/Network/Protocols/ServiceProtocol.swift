//
//  ServiceProtocol.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 18/02/21.
//

import Foundation

protocol ServiceProtocol {
    var path: String { get }
    var method: HttpMethods { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
}
