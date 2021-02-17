//
//  AutoLayout.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 16/02/21.
//

import UIKit

@propertyWrapper final class AutoLayout<View: UIView> {

    private lazy var view: View = {
        let view = View(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var wrappedValue: View {
        return view
    }
}
