//
//  CardsListView.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 17/02/21.
//

import UIKit
import SnapKit

protocol CardsListViewDelegate: AnyObject {
    func dismiss()
}

final class CardsListView: UIView {
    
    private let numberOfCardsPerRow: Int
    private let state: CardsListViewState
    weak var delegate: CardsListViewDelegate?
    
    var isLoading: Bool? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self, let isLoading = self.isLoading else { return }
                if isLoading {
                    self.addLoadingView()
                } else {
                    self.removeLoadingView()
                }
            }
        }
    }
    
    var title: String? {
        didSet {
            titleView.text = title?.capitalized
        }
    }
    
    init(frame: CGRect = .zero, numberOfCardsPerRow: Int, state: CardsListViewState) {
        self.numberOfCardsPerRow = numberOfCardsPerRow
        self.state = state
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Components
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
        layout.minimumInteritemSpacing = 35
        layout.sectionInset = UIEdgeInsets(top: 10, left: 28, bottom: 25, right: 28)
        layout.headerReferenceSize = CGSize(width: frame.width, height: 35)
        
        let spaceBetweenCells = layout.minimumInteritemSpacing * CGFloat(numberOfCardsPerRow - 1)
        let availableSpace = UIScreen.main.bounds.size.width -
            (layout.sectionInset.right + layout.sectionInset.left + spaceBetweenCells)
        
        layout.itemSize = CGSize(width: availableSpace/3, height: 125)
        return layout
    }()
    
    private(set) lazy var searchView: CardsListSearchView = {
        let placeholder = state == .favourites ? Texts.searchForFavorites.text : Texts.searchForCards.text
        let searchView = CardsListSearchView(placeholder: placeholder)
        searchView.translatesAutoresizingMaskIntoConstraints = false
        return searchView
    }()
    
    private let titleView: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = Fonts.robotoBold(size: 36).font
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "chevron.left",
                            withConfiguration: UIImage.SymbolConfiguration(pointSize: 25,
                                                                           weight: .light))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        button.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        return button
    }()
    
    private let backgroundView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .white
        return activityIndicator
    }()
    
    private let backButtonSearchViewStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 15
        return stackView
    }()
}

// MARK: ViewCodable
extension CardsListView: ViewCodable {
    
    func buildViewHierarchy() {
        
        if state != .favourites {
            backButtonSearchViewStackView.addArrangedSubview(backButton)
        }
        backButtonSearchViewStackView.addArrangedSubview(searchView)
    
        addSubview(backgroundView)
        addSubview(backButtonSearchViewStackView)
        addSubview(titleView)
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        
        backgroundView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        backButtonSearchViewStackView.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide).offset(30)
            make.leading.equalTo(safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-25)
        }
        
        titleView.snp.makeConstraints { (make) in
            make.top.equalTo(searchView.snp.bottom).offset(20)
            make.leading.equalTo(safeAreaLayoutGuide).offset(25)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-25)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(titleView.snp.bottom).offset(15)
            make.trailing.leading.bottom.equalToSuperview()
        }
        
    }
    
    func setupAdditionalConfiguration() {
        backgroundView.image = Constants.Images.backgroundImage
    }
    
}

// MARK: Actions
private extension CardsListView {
    
    @objc func dismiss() {
        delegate?.dismiss()
    }
    
}

// MARK: Loading
private extension CardsListView {
    
    func addLoadingView() {
        addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
        
        activityIndicator.startAnimating()
    }
    
    func removeLoadingView() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }

}
