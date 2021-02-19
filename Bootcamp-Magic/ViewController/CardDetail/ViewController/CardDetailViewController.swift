//
//  CardDetailViewController.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 18/02/21.
//

import Foundation
import SnapKit
import UIKit

final class CardDetailViewController: UIViewController {

    private var viewModel: CardDetailViewModel

    @AutoLayout var expansionNameLabel: UILabel
    @AutoLayout var backgroundImageVIew: UIImageView
    
    private let collectionViewFlowLayout = CardDetailCollectionViewFlowLayout()
    
    private lazy var detailCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)

    private lazy var collectionViewDataSource = CardDetailCollectionViewDataSource(cardsPaths: viewModel.sendImagesPath())

    private lazy var collectionViewFlowLayoutDelegate: CardDetailCollectionViewDelegate = CardDetailCollectionViewDelegate(superView: self.view, cards: viewModel.sendCards())

    init(viewModel: CardDetailViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)

        self.viewModel.delegate = self
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        self.view.addSubview(backgroundImageVIew)
        self.view.addSubview(expansionNameLabel)
        self.view.addSubview(detailCollectionView)
        setUpBackgrounImageView()
        setUpdetailCollectionView()
        setUpexpansionNameLabel()
        self.collectionViewFlowLayoutDelegate.delegate = self
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        backgroundImageViewConstraints()
        expansionLabelConstraints()
        detailCollectionViewConstraints()
        super.viewDidLayoutSubviews()
    }
    
    private func setUpBackgrounImageView() {
        
        backgroundImageVIew.image = Constants.Images.backgroundImage
    }

    private func setUpexpansionNameLabel() {

        expansionNameLabel.textAlignment = .center
        expansionNameLabel.adjustsFontSizeToFitWidth = true
        expansionNameLabel.textColor = .white
        expansionNameLabel.font = Fonts.robotoBold(size: 30).font
        expansionNameLabel.text = viewModel.sendFirtsExpansionName()
    }

    private func setUpdetailCollectionView() {

        detailCollectionView.backgroundColor = .clear
        detailCollectionView.showsVerticalScrollIndicator = false
        detailCollectionView.allowsMultipleSelection = false
        detailCollectionView.delegate = collectionViewFlowLayoutDelegate
        detailCollectionView.dataSource = collectionViewDataSource
        detailCollectionView.register(CardDetailCollectionViewCell.self, forCellWithReuseIdentifier: CardDetailCollectionViewCell.cellID())
        detailCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func backgroundImageViewConstraints() {
        
        backgroundImageVIew.snp.makeConstraints {  maker in
            maker.edges.equalToSuperview()
        }
    }

    private func expansionLabelConstraints() {

        expansionNameLabel.snp.makeConstraints { maker in
            maker.top.equalTo(self.view).offset(130)
            maker.centerX.equalTo(self.view)
            maker.width.equalToSuperview().multipliedBy(0.8)
            maker.height.equalTo(60)
        }
    }

    private func detailCollectionViewConstraints() {

        detailCollectionView.snp.makeConstraints { maker in
            maker.top.equalTo(self.expansionNameLabel.snp.bottom).offset(50)
            maker.centerX.equalToSuperview()
            maker.width.equalToSuperview()
            maker.height.equalToSuperview().multipliedBy(0.46)
        }
    }
}

extension CardDetailViewController: CardDetailViewModelDelegate {
    func updateUI() {
        DispatchQueue.main.async { [weak self] in
            self?.expansionNameLabel.text = self?.viewModel.sendExpansionName()
        }
    }
}

extension CardDetailViewController: DidDisplayCellDelegate {
    func didOffsetChanged(offset: CGFloat, toPrevious: Bool) {

        let previousOffset: CGFloat = toPrevious ? self.detailCollectionView.frame.size.width * 0.7 : 0
        let contentIndex = Int(ceil((offset - previousOffset) / self.detailCollectionView.frame.size.width))
        let cardsCount: Int = viewModel.sendCards().count

        let index = contentIndex < cardsCount ? contentIndex : cardsCount - 1
        
        detailCollectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
        viewModel.setExpansionName(index: index)
    }
}
