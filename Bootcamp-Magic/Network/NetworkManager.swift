//
//  NetworkManager.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 15/02/21.
//

import Foundation
import UIKit

enum HttpMethods: String {
    case get = "Get"
}

final class NetworkManager {

  private let service: NetworkService
  private let cache = ImageCache()

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
                completion(.failure(NetworkError.notUrl(networkErrorDescription: "Could not use URL as Response")))
                return
            }

            if httpResponse.statusCode == 200 {

                guard let data = data else {
                    completion(.failure(NetworkError.requestFailed(networkErrorDescription: "Could not retrive data from URL")))
                    return
                }

                guard let decodedData = self.decode(decodableType: decodableType, data: data) else {
                    completion(.failure(NetworkError.failedToDecode(networkErrorDescription: "Failed to decode Object from data")))
                    return
                }

                completion(.success(decodedData))
            } else {
                completion(.failure(NetworkError.requestFailed(networkErrorDescription:
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

    func getRequest<T: Decodable>(cardsService: CardsService,
                                  decodableType: T.Type,
                                  completion: @escaping (Result<T, Error>) -> Void) {

        guard let url = URL(string: cardsService.path) else {
            completion(.failure(NetworkError.notUrl(networkErrorDescription: "Could not Create URL")))
            return
        }

        let request = createRequest(url: url, method: .get)

        for headerParam in cardsService.headers ?? [:] {
            request.addValue(headerParam.value, forHTTPHeaderField: headerParam.key)
        }

        self.dataTask(request: request, decodableType: decodableType, completion: completion)
    }

    func getImageFromURL(imagesService: ImagesService, completion: @escaping (Result<UIImage, Error>) -> Void) {
        
        guard let url = URL(string: imagesService.path) else {
            completion(.failure(NetworkError.notUrl(networkErrorDescription: "Could not Create URL")))
            return
        }
      
        // Check if image is already cached
        if let image = cache[url] {
          completion(.success(image))
          return
        }
        
        let request = createRequest(url: url, method: .get)
        
        service.dataTask(with: request as URLRequest) { [weak self] data, response, error in
            
            if let serviceError = error {
                completion(.failure(serviceError))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.notUrl(networkErrorDescription: "Could not use URL as Response")))
                return
            }
            
            if httpResponse.statusCode == 200 {
                
                guard let data = data else {
                    completion(.failure(NetworkError.requestFailed(networkErrorDescription: "Could not retrive data from URL")))
                    return
                }
                
                guard let image = UIImage(data: data) else {
                    completion(.failure(NetworkError.failedToDecode(networkErrorDescription: "Could not transform data to UIImage")))
                    return
                }
              
                // Cache image
                self?.cache[url] = image
                completion(.success(image))
            }
        }.resume()
    }
}
