//
//  NetworkServiceStub.swift
//  Bootcamp-MagicTests
//
//  Created by pedro.silveira on 16/02/21.
//

import Foundation
@testable import Bootcamp_Magic

final class NetworkServiceStub: NetworkService {

    let bundle: Bundle
    var json: URL?

    var shouldFail: Bool = false
    var statusCode: Int = 200

    init(bundle: Bundle) {
        self.bundle = bundle
    }

    func dataTask(with url: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {

        if shouldFail {
            completionHandler(nil, nil, NetworkError.purposefulError)
            return ServiceFakeDataTask()
        }

        guard let urlPath = url.url else {
            completionHandler(nil, nil, nil)
            return ServiceFakeDataTask()
        }

        let urlResponse = HTTPURLResponse(url: urlPath, statusCode: statusCode, httpVersion: nil, headerFields: nil)

        if statusCode != 200 {
            completionHandler(nil, urlResponse, nil)
            return ServiceFakeDataTask()
        }

        guard let jsonUrl = json, let data = try? Data(contentsOf: jsonUrl) else {
            completionHandler(nil, nil, nil)
            return ServiceFakeDataTask()
        }

        completionHandler(data, urlResponse, nil)

        return ServiceFakeDataTask()
    }

}
