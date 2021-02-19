//
//  CardDetailCollectionViewDelegate.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 18/02/21.
//

import Foundation
import UIKit

final class CardDetailCollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    private let superView: UIView
    private let cards: [CardViewModel]
    private var lastDeceleratingOffset: CGFloat = 0
    private var lastDraggingOffset: CGFloat = 0
    
    weak var delegate: DidDisplayCellDelegate?

    init(superView: UIView, cards: [CardViewModel]) {
        self.superView = superView
        self.cards = cards
    }
    
    private func updateOffset(offSet: inout CGFloat, scrollView: UIScrollView) {
        let toPrevious: Bool = scrollView.contentOffset.x < offSet
        
        delegate?.didOffsetChanged(offset: scrollView.contentOffset.x, toPrevious: toPrevious)
        offSet = scrollView.contentOffset.x
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let horizontalSpacing = (UIScreen.main.bounds.width * 0.054)
        return horizontalSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let horizontalInset = (UIScreen.main.bounds.width * 0.15)
        
        return .init(top: 0, left: horizontalInset, bottom: 0, right: horizontalInset)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        guard let collection = scrollView as? UICollectionView else {
            return
        }
        
        let centerX = collection.center.x

        for cell in collection.visibleCells {

            let basePosition = cell.convert(CGPoint.zero, to: self.superView)
            let cellCenterX = basePosition.x + collection.frame.size.width / 2.0

            let distance = abs(cellCenterX - centerX)

            let tolerance : CGFloat = 0.02
            var scale = 1.00 + tolerance - (( distance / centerX ) * 0.105)
            if(scale > 1.0) {
                scale = 1.0
            }

            if(scale < 0.94) {
                scale = 0.94
            }

            cell.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        updateOffset(offSet: &lastDraggingOffset, scrollView: scrollView)
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        
        updateOffset(offSet: &lastDeceleratingOffset, scrollView: scrollView)
    }
}
