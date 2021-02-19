//
//  UIImageView+DownloadImage.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 19/02/21.
//

import UIKit
import SnapKit

extension UIImageView {
    
    var activityIndicator: UIActivityIndicatorView {
        
        let activity = UIActivityIndicatorView(style: .medium)
        addSubview(activity)
        
        activity.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        return activity
    }
    
    func downloadImage(with path: String) {
        
        let activity = activityIndicator
        activity.startAnimating()
        
        DownloadImage.shared.loadImage(with: path) { [weak self] (image) in
            DispatchQueue.main.async {
                self?.image = image
                activity.stopAnimating()
                activity.removeFromSuperview()
            }
        }
    }
    
}

// MARK: NestedTypes
extension UIImageView {
    
    fileprivate final class DownloadImage {
        
        static let shared = DownloadImage()
        var networkManager = NetworkManager()
        
        private init() {}
        
        func loadImage(with path: String, completion: @escaping (UIImage?) -> Void) {
            networkManager.getImageFromURL(imagesService: .cardImage(imagePath: path)) { (result) in
                switch result {
                case .success(let image):
                    completion(image)
                case .failure(let error):
                    print("Error to download image - \(error)")
                    completion(nil)
                }
            }
        }
    }
}
