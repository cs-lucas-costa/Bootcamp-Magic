//
//  RequestError.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 15/02/21.
//

import Foundation

protocol RequestError: LocalizedError {
    var title: String? { get }
    var description: String { get }
}
