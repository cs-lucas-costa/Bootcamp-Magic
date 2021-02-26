//
//  ViewFailable.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 26/02/21.
//

import UIKit

protocol ViewFailable: UIView {
    
    var viewWithError: UIView { get }
    var failableView: ErrorHandlingView { get }
    
    func addFailableView()
    func removeFailableView()
}

extension ViewFailable {
    
    func addFailableView() {
        
        viewWithError.addSubview(failableView)
        
        failableView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }

    func removeFailableView() {
        failableView.removeFromSuperview()
    }
}
