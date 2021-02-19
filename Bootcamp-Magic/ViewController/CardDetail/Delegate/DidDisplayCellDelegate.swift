//
//  DidDisplayCellDelegate.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 19/02/21.
//

import CoreGraphics

protocol DidDisplayCellDelegate: AnyObject {
    func didOffsetChanged(offset: CGFloat, toPrevious: Bool)
}
