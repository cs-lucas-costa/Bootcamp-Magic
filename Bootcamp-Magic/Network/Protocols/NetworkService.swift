//
//  NetworkService.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 15/02/21.
//

import Foundation

/// The service responsible for performing local requests for testing.
protocol  NetworkService {
    func dataTask(with url: URLRequest, completionHandler: @escaping (Data?,
                                                                     URLResponse?,
                                                                     Error?) -> Void) -> URLSessionDataTask
}
