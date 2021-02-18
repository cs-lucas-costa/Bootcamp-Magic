//
//  NetworkError.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 15/02/21.
//

import Foundation

enum NetworkError {
    case notUrl(networkErrorDescription: String)
    case requestFailed(networkErrorDescription: String)
    case failedToDecode(networkErrorDescription: String)
    case purposefulError
}

extension NetworkError: RequestError {

    var description: String {
        switch self {
        case .notUrl(let networkErrorDescription):
            return networkErrorDescription
        case .requestFailed(let networkErrorDescription):
            return networkErrorDescription
        case .failedToDecode(let networkErrorDescription):
            return networkErrorDescription
        case .purposefulError:
            return "Should Fail"
        }
    }

    var title: String? {
        switch self {
        case .notUrl:
            return "Invalid URL"
        case .requestFailed:
            return "Unable to complete the Request"
        case .failedToDecode:
            return "Unable to Decode the response"
        case .purposefulError:
            return "Purposeful Error"
        }
    }

    var errorDescription: String? { return description }
    var failureReason: String? { return description }

}
