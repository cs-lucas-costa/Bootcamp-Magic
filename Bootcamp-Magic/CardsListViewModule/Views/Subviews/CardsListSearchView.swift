//
//  CardListSearchView.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 17/02/21.
//

import UIKit
import SnapKit

protocol CardsListSearchViewDelegate: AnyObject {
    func textDidChange(_ text: String)
    func didCancelSearch()
}

final class CardsListSearchView: UIView {
    
    weak var delegate: CardsListSearchViewDelegate?
    private let placeholder: String

    private lazy var textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = placeholder
        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                             attributes: [.foregroundColor: UIColor.white,
                                                                          .font: Fonts.robotoBold(size: 14).font])
        textField.addTarget(self, action: #selector(searchCards), for: .valueChanged)
        textField.font = Fonts.robotoBold(size: 14).font
        return textField
    }()
        
    private let searchButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = Fonts.robotoBold(size: 14).font
        button.tintColor = .white
        button.addTarget(self, action: #selector(cancelSearch), for: .touchUpInside)
        return button
    }()
    
    private let stackViewTextFieldSearchButton: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.white.cgColor
        stackView.layer.cornerRadius = 4
        stackView.clipsToBounds = true
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10,
                                                                     leading: 15,
                                                                     bottom: 10,
                                                                     trailing: 15)
        return stackView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 15
        return stackView
    }()
    
    init(frame: CGRect = .zero, placeholder: String) {
        self.placeholder = placeholder
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: ViewCodable
extension CardsListSearchView: ViewCodable {
    
    func buildViewHierarchy() {
        
        stackViewTextFieldSearchButton.addArrangedSubview(textField)
        stackViewTextFieldSearchButton.addArrangedSubview(searchButton)
        
        mainStackView.addArrangedSubview(stackViewTextFieldSearchButton)
        mainStackView.addArrangedSubview(cancelButton)
        addSubview(mainStackView)
    }
    
    func setupConstraints() {
        mainStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}

// MARK: Actions
private extension CardsListSearchView {
    
    @objc func searchCards(with text: String) {
        delegate?.textDidChange(text)
    }
    
    @objc func cancelSearch() {
        textField.text = ""
        delegate?.didCancelSearch()
    }
}
