//
//  ViewLoadable.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 26/02/21.
//

import UIKit

protocol ViewLoadable {
    
    var parentView: UIView { get }
    var activityIndicator: UIActivityIndicatorView { get }
    
    func addLoadingView()
    func removeLoadingView()
}

extension ViewLoadable {
    
    func addLoadingView() {
        parentView.addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints { (make) in
            make.centerX.centerY.equalTo(parentView)
        }
        
        activityIndicator.startAnimating()
    }

    func removeLoadingView() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
}
