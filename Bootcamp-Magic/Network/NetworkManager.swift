//
//  NetworkManager.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 15/02/21.
//

import Foundation

enum HttpMethods: String {
    case get = "Get"
}

private protocol RequestError: LocalizedError {
    var title: String? { get }
}

struct NotURLError: RequestError {

    var title: String?
    var errorDescription: String? { return description }
    var failureReason: String? { return description }

    private var description: String

    init(title: String?, description: String) {
        self.title = title ?? "Invalid URL"
        self.description = description
    }
}

struct RequestFailedError: RequestError {

    var title: String?
    var errorDescription: String? { return description }
    var failureReason: String? { return description }

    private var description: String

    init(title: String?, description: String) {
        self.title = title ?? "Unable to complete the Request"
        self.description = description
    }
}

final class NetworkManager {

    private let service: NetworkService

    init(service: NetworkService = URLSession.shared) {
        self.service = service
    }

    private func createRequest(url: URL, method: HttpMethods) -> NSMutableURLRequest {

        let request = NSMutableURLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }

    private func dataTask<T: Decodable>(request: NSMutableURLRequest,
                                        decodableType: T.Type,
                                        completion: @escaping (Result<T, Error>) -> Void) {

        service.dataTask(with: request as URLRequest) { (data, response, error) in

            if let serviceError = error {
                completion(.failure(serviceError))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NotURLError(title: nil, description: "Could not use URL as Response")))
                return
            }

            if httpResponse.statusCode == 200 {

                guard let data = data else {
                    completion(.failure(RequestFailedError(title: nil, description: "Could not retrive data from URL")))
                    return
                }

                guard let decodedData = self.decode(decodableType: decodableType, data: data) else {
                    return
                }

                completion(.success(decodedData))
            } else {
                completion(.failure(RequestFailedError(title: nil, description:
                                                        "Network request failed due to unexpected HTTP status code")))
            }
        }.resume()
    }

    private func decode<T: Decodable>(decodableType: T.Type, data: Data) -> T? {

        do {
            let decoded = try JSONDecoder().decode(decodableType.self, from: data)
            return decoded
        } catch {
            return nil
        }
    }

    func getRequest<T: Decodable>(
        url: URL,
        decodableType: T.Type,
        header: [String: String]? = nil,
        completion: @escaping (Result<T, Error>) -> Void) {

        let request = createRequest(url: url, method: .get)

        for headerParam in header ?? [:] {
            request.addValue(headerParam.value, forHTTPHeaderField: headerParam.key)
        }

        self.dataTask(request: request, decodableType: decodableType, completion: completion)
    }
}
