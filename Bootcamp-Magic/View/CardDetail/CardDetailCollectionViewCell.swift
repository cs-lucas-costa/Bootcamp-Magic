//
//  CardDetailCollectionViewCell.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 18/02/21.
//

import Foundation
import UIKit
import SnapKit

final class CardDetailCollectionViewCell: UICollectionViewCell {

    @AutoLayout private var cardImageView: UIImageView

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(cardImageView)
        setUpCardImageConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpCardImage(with image: UIImage) {
        cardImageView.image = image
    }

    private func setUpCardImageConstraints() {
        cardImageView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }

    static func cellID() -> String {
        return "DetailCollectionViewCell"
    }

}
