//
//  CardDetailToggleButton.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 24/02/21.
//

import UIKit
import SnapKit

final class CardDetailToggleButton: UIButton {
    
    private var favoriteLabel: UILabel = UILabel(frame: .zero)
    
    private var isFavorite: Bool = false {
        didSet {
            if isFavorite {
                favoriteLabel.text = "Remove from favorite"
                backgroundColor = .red
            } else {
                favoriteLabel.text = "Add to favorites"
                backgroundColor = .clear
            }
        }
    }
    
    init() {
                
        super.init(frame: .zero)
        
        self.addSubview(favoriteLabel)
        setupLabel()
        setupLabelConstraints()
        setupLayer()
        self.backgroundColor = .clear
        self.addTarget(self, action: #selector(toggleIsFavorite), for: .touchDown)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel() {
        favoriteLabel.textAlignment = .center
        favoriteLabel.adjustsFontSizeToFitWidth = true
        favoriteLabel.textColor = .white
        favoriteLabel.font = Fonts.robotoBold(size: 16).font
        favoriteLabel.text = "Add to favorites"
    }
    
    private func setupLabelConstraints() {
        favoriteLabel.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
            maker.width.equalToSuperview().multipliedBy(0.573)
            maker.height.equalTo(24)
        }
    }
    
    private func setupLayer() {
        
        let color: UIColor = .white
     
        layer.borderWidth = 2
        layer.borderColor = color.cgColor
        layer.cornerRadius = 3
        clipsToBounds = true
    }
    
    @objc func toggleIsFavorite() {
        self.isFavorite = !isFavorite
    }
    
}

extension CardDetailToggleButton: CardDetailToggleButtonDelegate {
    func didChangeCard(isFavorite: Bool) {
        self.isFavorite = isFavorite
    }
}
