//
//  ImageCacheType.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 25/02/21.
//

import UIKit

// Declares in-memory image cache
protocol ImageCacheType: class {
  // Returns the image associated with a given url
  func image(for url: URL) -> UIImage?
  // Inserts the image of the specified url in the cache
  func insertImage(_ image: UIImage?, for url: URL)
  // Removes the image of the specified url in the cache
  func removeImage(for url: URL)
  // Accesses the value associated with the given key for reading and writing
  subscript(_ url: URL) -> UIImage? { get set }
}
