//
//  CardsService.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 15/02/21.
//

import Foundation

protocol ServiceProtocol {
    var path: String { get }
    var method: HttpMethods { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
}

enum CardsService {
    case cardsList(setCode: String)
    case setList
    case cardImage(imagePath: String)
}

extension CardsService: ServiceProtocol {

    private var basePath: String {
        return "https://api.magicthegathering.io/v1"
    }

    var path: String {
        switch self {
        case .cardsList(let code):
            return (self.basePath + "/cards?set=" + code)
        case .setList:
            return (self.basePath + "/sets?page=1&pageSize=40")
        case .cardImage(let imagePath):
            return imagePath
        }
    }

    var method: HttpMethods {
        switch self {
        case .cardsList:
            return .get
        case .setList:
            return .get
        case .cardImage:
            return .get
        }
    }

    var parameters: [String : Any]? {
        switch self {
        case .cardsList:
            return nil
        case .setList:
            return nil
        case .cardImage:
            return nil
        }
    }

    var headers: [String : String]? {
        switch self {
        case .cardsList:
            return nil
        case .setList:
            return nil
        case .cardImage:
            return nil
        }
    }
}
