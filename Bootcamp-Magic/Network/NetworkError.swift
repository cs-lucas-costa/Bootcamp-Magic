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
        }
    }
    
    var errorDescription: String? { return description }
    var failureReason: String? { return description }
    
    
}

struct NotURLError: RequestError {

    var title: String?
    var errorDescription: String? { return description }
    var failureReason: String? { return description }

    var description: String

    init(title: String?, description: String) {
        self.title = title ?? "Invalid URL"
        self.description = description
    }
}

struct RequestFailedError: RequestError {

    var title: String?
    var errorDescription: String? { return description }
    var failureReason: String? { return description }

    var description: String

    init(title: String?, description: String) {
        self.title = title ?? "Unable to complete the Request"
        self.description = description
    }
}
