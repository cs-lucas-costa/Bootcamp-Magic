//
//  ErrorHandlingView.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 26/02/21.
//

import Foundation
import UIKit
import SnapKit

final class ErrorHandlingView: UIView {
    
    // MARK: - Properties
    private var errorDidOccurLabel: UILabel = UILabel(frame: .zero)
    
    private var backgroundImageView = UIImageView(frame: .zero)

    var retryButton = ErrorHandlingButton()
    
    // MARK: - Inits
    init(frame: CGRect = .zero, error: String) {
        super.init(frame: frame)
        setupView()
        self.errorDidOccurLabel.text = error
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setupExpansionNameLabel() {
        errorDidOccurLabel.textAlignment = .center
        errorDidOccurLabel.adjustsFontSizeToFitWidth = true
        errorDidOccurLabel.textColor = .white
        errorDidOccurLabel.font = Fonts.robotoBold(size: 30).font
    }
    
    private func setupBackgroundImage() {
        backgroundImageView.image = Constants.Images.backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
    }
}

// MARK: - ViewCodable Extensions
extension ErrorHandlingView: ViewCodable {
    func buildViewHierarchy() {

        addSubview(backgroundImageView)
        addSubview(errorDidOccurLabel)
        addSubview(retryButton)
    }
    
    func setupConstraints() {
        
        backgroundImageView.snp.makeConstraints {  maker in
            maker.edges.equalToSuperview()
        }
        
        errorDidOccurLabel.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
            maker.width.equalToSuperview().multipliedBy(0.8)
            maker.height.equalTo(100)
        }
        
        retryButton.snp.makeConstraints { maker in
            maker.top.equalTo(errorDidOccurLabel.snp.bottom).offset(50)
            maker.centerX.equalToSuperview()
            maker.width.equalToSuperview().multipliedBy(0.688)
            maker.height.equalToSuperview().multipliedBy(0.06)
        }
    }
    
    func setupAdditionalConfiguration() {
        setupBackgroundImage()
        setupExpansionNameLabel()
    }
    
}
