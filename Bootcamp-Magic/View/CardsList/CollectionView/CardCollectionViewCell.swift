//
//  CardCollectionViewCell.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 17/02/21.
//

import UIKit
import SnapKit

final class CardCollectionViewCell: UICollectionViewCell {
        
    private var image: UIImage? {
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
        let activityIndicator = UIActivityIndicatorView()
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupLoadingStyle(_ style: UIActivityIndicatorView.Style) {
        activityIndicator.style = style
    }
    
    func setup(image: UIImage?) {
        self.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
