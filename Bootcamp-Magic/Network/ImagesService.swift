//
//  ImagesService.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 18/02/21.
//

import Foundation

enum ImagesService {
    case cardImage(imagePath: String)
}

extension ImagesService: ServiceProtocol {

    var path: String {
        switch self {
        case .cardImage(let imagePath):
            return imagePath
        }
    }

    var method: HttpMethods {
        switch self {
        case .cardImage:
            return .get
        }
    }

    var parameters: [String : Any]? {
        switch self {
        case .cardImage:
            return nil
        }
    }

    var headers: [String : String]? {
        switch self {
        case .cardImage:
            return nil
        }
    }
}
