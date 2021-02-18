//
//  CardsListView.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 17/02/21.
//

import UIKit
import SnapKit

final class CardsListView: UIView {
    
    private let numberOfCardsPerRow: Int
    
    var expansionTitle: String? {
        didSet {
            expansionTitleView.text = expansionTitle?.capitalized
        }
    }
    
    init(frame: CGRect = .zero, numberOfCardsPerRow: Int) {
        self.numberOfCardsPerRow = numberOfCardsPerRow
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private(set) lazy var collectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.register(CardCollectionViewCell.self,
                                forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        collectionView.register(CardsListHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: CardsListHeaderView.identifier)
        return collectionView
    }()
    
    private lazy var layout: UICollectionViewLayout = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.headerReferenceSize = CGSize(width: frame.width, height: 35)
        
        let spaceBetweenCells = layout.minimumInteritemSpacing * CGFloat(numberOfCardsPerRow - 1)
        let availableSpace = UIScreen.main.bounds.size.width -
            (layout.sectionInset.right + layout.sectionInset.left + spaceBetweenCells)
        
        layout.itemSize = CGSize(width: availableSpace/3, height: 125)
        return layout
    }()
    
    private(set) var searchView: CardsListSearchView = {
        let searchView = CardsListSearchView(placeholder: "Search")
        searchView.translatesAutoresizingMaskIntoConstraints = false
        return searchView
    }()
    
    private let expansionTitleView: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    private let backgroundView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
}

//MARK: ViewCodable
extension CardsListView: ViewCodable {
    
    func buildViewHierarchy() {
        addSubview(backgroundView)
        addSubview(searchView)
        addSubview(expansionTitleView)
        addSubview(collectionView)
    }

    
    func setupConstraints() {
        
        backgroundView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        searchView.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalTo(safeAreaLayoutGuide).offset(15)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-15)
        }
        
        expansionTitleView.snp.makeConstraints { (make) in
            make.top.equalTo(searchView.snp.bottom).offset(15)
            make.leading.equalTo(safeAreaLayoutGuide).offset(15)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-15)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(expansionTitleView.snp.bottom).offset(15)
            make.trailing.leading.bottom.equalTo(safeAreaLayoutGuide)
        }
        
    }
    
    func setupAdditionalConfiguration() {
        backgroundView.image = UIImage(named: "background")
    }
    
}
