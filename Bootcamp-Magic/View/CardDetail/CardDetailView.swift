//
//  CardDetailView.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 22/02/21.
//

import Foundation
import UIKit
import SnapKit

protocol CardDetailViewDelegate: AnyObject {
    func dismiss()
}

final class CardDetailView: UIView {
    
    // MARK: - Properties
    var expansionNameLabel: UILabel = UILabel(frame: .zero)
    weak var delegate: CardDetailViewDelegate?
    private let collectionViewFlowLayout = CardDetailCollectionViewFlowLayout()
    private var backgroundImageView = UIImageView(frame: .zero)
    lazy var favoriteButton: CardDetailToggleButton = CardDetailToggleButton()

    // MARK: Constants
    private static let closeButtonEdges = UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 0)

    private lazy var closeButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(systemName: "xmark",
                                withConfiguration: UIImage.SymbolConfiguration(pointSize: 44,
                                                                               weight: .light)),
                        for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        return button
    }()
    private(set) lazy var detailCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
    
    // MARK: - Inits
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
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
        backgroundImageView.image = Constants.Images.backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
    }
}

// MARK: - ViewCodable Extensions
extension CardDetailView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(backgroundImageView)
        addSubview(closeButton)
        addSubview(expansionNameLabel)
        addSubview(detailCollectionView)
        addSubview(favoriteButton)
    }
    
    func setupConstraints() {
        
        backgroundImageView.snp.makeConstraints {  maker in
            maker.edges.equalToSuperview()
        }
        
        closeButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(safeAreaLayoutGuide).offset(CardDetailView.closeButtonEdges.top)
            maker.left.equalToSuperview().offset(CardDetailView.closeButtonEdges.left)
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
        
        favoriteButton.snp.makeConstraints { maker in
            maker.top.equalTo(self.detailCollectionView.snp.bottom).offset(64)
            maker.centerX.equalToSuperview()
            maker.width.equalToSuperview().multipliedBy(0.688)
            maker.height.equalToSuperview().multipliedBy(0.06)
        }
    }
    
    func setupAdditionalConfiguration() {
        setupBackgroundImage()
        setupExpansionNameLabel()
        setupDetailCollectionView()
    }
    
    func getCollectionViewCellFrame(at index: Int) -> CGRect {
        let indexPath = IndexPath(item: index, section: 0)
        guard let cell = detailCollectionView.cellForItem(at: indexPath) else {
            return .init(x: 0, y: 0, width: 0, height: 0)
        }
        
        return cell.frame
    }
    
}

// MARK: Actions
extension CardDetailView {
    @objc func dismiss() {
        delegate?.dismiss()
    }
}
