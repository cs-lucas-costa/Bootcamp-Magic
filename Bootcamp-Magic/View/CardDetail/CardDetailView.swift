//
//  CardDetailView.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 22/02/21.
//

import Foundation
import UIKit
import SnapKit

final class CardDetailView: UIView {
    
    @AutoLayout var expansionNameLabel: UILabel
    @AutoLayout private var backgroundImageView: UIImageView
    
    private let collectionViewFlowLayout = CardDetailCollectionViewFlowLayout()
    
    private(set) lazy var detailCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupExpansionNameLabel() {
        expansionNameLabel.textAlignment = .center
        expansionNameLabel.adjustsFontSizeToFitWidth = true
        expansionNameLabel.textColor = .white
        expansionNameLabel.font = Fonts.robotoBold(size: 30).font
    }
    
    private func setupDetailCollectionView() {
        detailCollectionView.backgroundColor = .clear
        detailCollectionView.showsVerticalScrollIndicator = false
        detailCollectionView.allowsMultipleSelection = false
        detailCollectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        detailCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupBackgroundImage() {
        backgroundImageVIew.image = Constants.Images.backgroundImage
        backgroundImageVIew.contentMode = .scaleAspectFill
    }
}

extension CardDetailView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(backgroundImageVIew)
        addSubview(expansionNameLabel)
        addSubview(detailCollectionView)
    }
    
    func setupConstraints() {
        
        backgroundImageVIew.snp.makeConstraints {  maker in
            maker.edges.equalToSuperview()
        }
        
        expansionNameLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(130)
            maker.centerX.equalToSuperview()
            maker.width.equalToSuperview().multipliedBy(0.8)
            maker.height.equalTo(60)
        }
        
        detailCollectionView.snp.makeConstraints { maker in
            maker.top.equalTo(self.expansionNameLabel.snp.bottom).offset(50)
            maker.centerX.equalToSuperview()
            maker.width.equalToSuperview()
            maker.height.equalToSuperview().multipliedBy(0.46)
        }
    }
    
    func setupAdditionalConfiguration() {
        setupBackgroundImage()
        setupExpansionNameLabel()
        setupDetailCollectionView()
    }
}
