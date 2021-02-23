//
//  CardDetailCollectionViewDelegateTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by pedro.silveira on 23/02/21.
//

import XCTest

@testable import Bootcamp_Magic

final class CardDetailCollectionViewDelegateTestCase: XCTestCase {
    
    var sut: CardDetailCollectionViewDelegate!
    var fakeCardsArray: FakeCardsArray!
    var fakeSuperView: UIView!

    override func setUp() {
        super.setUp()
        
        fakeCardsArray = FakeCardsArray()
        fakeSuperView = UIView(frame: UIScreen.main.bounds)
        sut = CardDetailCollectionViewDelegate(superView: fakeSuperView, cards: fakeCardsArray.getCards())
    }
    
    override func tearDown() {
        sut = nil
        fakeCardsArray = nil
        fakeSuperView = nil
        super.tearDown()
    }
    
    func testChangeOffsetBehavior() {
        
        let baseValue = CGFloat(10)
        let fakeScroolView = UIScrollView(frame: UIScreen.main.bounds)
        fakeScroolView.contentOffset = CGPoint(x: baseValue, y: CGFloat(0))
        
        sut.scrollViewWillBeginDecelerating(fakeScroolView)
        
        XCTAssertEqual(sut.lastDeceleratingOffset, baseValue)
    }
    
}
