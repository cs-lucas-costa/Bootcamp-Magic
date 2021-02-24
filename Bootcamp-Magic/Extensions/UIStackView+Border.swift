//
//  UIStackView+Border.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 23/02/21.
//

import UIKit
import SnapKit

extension UIStackView {
    
    func addBorder(color: UIColor, width: CGFloat, cornerRadius: CGFloat = 0) {
        
        if #available(iOS 14, *) {
            layer.borderWidth = width
            layer.borderColor = color.cgColor
            layer.cornerRadius = cornerRadius
            clipsToBounds = true

        } else {
            let backgroundView = UIView(frame: .zero)
            backgroundView.layer.borderWidth = width
            backgroundView.layer.borderColor = color.cgColor
            backgroundView.layer.cornerRadius = cornerRadius
            backgroundView.clipsToBounds = true
            
            insertSubview(backgroundView, at: 0)
            
            backgroundView.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
        }
    }
    
}
