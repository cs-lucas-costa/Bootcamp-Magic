//
//  CardCollectionViewCell.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 17/02/21.
//

import UIKit
import SnapKit

final class CardCollectionViewCell: UICollectionViewCell {
    
    var activityIndicatorStyle: UIActivityIndicatorView.Style = .medium
    
    var image: UIImage? {
        didSet {
            imageView.image = image
            removeLoadingView()
        }
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    private(set) lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: activityIndicatorStyle)
        activityIndicator.color = .white
        return activityIndicator
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        addLoadingView()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        addLoadingView()
    }
}

// MARK: ViewCodable
extension CardCollectionViewCell: ViewCodable {
    
    func buildViewHierarchy() {
        contentView.addSubview(imageView)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView)
        }
    }
}

// MARK: View Loadable
extension CardCollectionViewCell: ViewLoadable {
    var parentView: UIView {
        contentView
    }
}
