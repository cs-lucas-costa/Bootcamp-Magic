//
//  CardsListHeaderView.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 17/02/21.
//

import UIKit
import SnapKit

final class CardsListHeaderView: UICollectionReusableView {
    
    var title: String? {
        didSet {
            titleView.text = title
        }
    }
    
    private let titleView: UILabel = {
        let titleView = UILabel(frame: .zero)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.backgroundColor = .clear
        titleView.font = Fonts.robotoBold(size: 16).font
        titleView.textColor = .white
        return titleView
    }()
        
}

// MARK: ViewCodable
extension CardsListHeaderView: ViewCodable {
    
    func buildViewHierarchy() {
        addSubview(titleView)
    }
    
    func setupConstraints() {
        titleView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
            make.top.bottom.equalToSuperview()
        }
    }
    
}
