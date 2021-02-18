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

    @AutoLayout private var expansionNameLabel: UILabel

    @AutoLayout private var detailCollectionView: UICollectionView

    private lazy var collectionViewDataSource = CardDetailCollectionViewDataSource(cards: viewModel.sendCardsImage())

    private lazy var collectionViewFlowLayoutDelegate: CardDetailCollectionViewDelegate = CardDetailCollectionViewDelegate(detailCollectionView: detailCollectionView, superView: self.view)

    init(viewModel: CardDetailViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        self.view.addSubview(expansionNameLabel)
        self.view.addSubview(detailCollectionView)
        setUpdetailCollectionView()
        setUpexpansionNameLabel()
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        expansionLabelConstraints()
        detailCollectionViewConstraints()
        super.viewDidLayoutSubviews()
    }

    private func setUpexpansionNameLabel() {

        expansionNameLabel.textAlignment = .center
        expansionNameLabel.adjustsFontSizeToFitWidth = true
        expansionNameLabel.textColor = .white
        expansionNameLabel.font = UIFont(name: "Roboto", size: 30)
        expansionNameLabel.text = "Teste"
    }

    private func setUpdetailCollectionView() {

        detailCollectionView.showsVerticalScrollIndicator = false
        detailCollectionView.allowsMultipleSelection = false
        detailCollectionView.delegate = collectionViewFlowLayoutDelegate
        detailCollectionView.dataSource = collectionViewDataSource
        detailCollectionView.register(CardDetailCollectionViewCell.self, forCellWithReuseIdentifier: CardDetailCollectionViewCell.cellID())
    }

    private func expansionLabelConstraints() {

        expansionNameLabel.snp.makeConstraints { maker in
            maker.top.equalTo(self.view).offset(130)
            maker.center.equalTo(self.view)
            maker.width.equalToSuperview().multipliedBy(0.8)
            maker.height.equalTo(expansionNameLabel.frame.width).multipliedBy(0.14)
        }
    }

    private func detailCollectionViewConstraints() {

        detailCollectionView.snp.makeConstraints { maker in
            maker.top.equalTo(self.expansionNameLabel).offset(50)
            maker.center.equalToSuperview()
            maker.width.equalToSuperview()
            maker.height.equalToSuperview().multipliedBy(0.46)
        }
    }
}
