//
//  CardDetailTestCase.swift
//  Bootcamp-MagicTests
//
//  Created by pedro.silveira on 23/02/21.
//

import XCTest
import SnapshotTesting

@testable import Bootcamp_Magic

class CardDetailTestCase: XCTestCase {

    var sut: CardDetailView!
    var dataSource: CardDetailCollectionViewDataSource!
    var service: NetworkServiceStub!
    var networkManager: NetworkManager!
    
    override func setUp() {
        super.setUp()
        let bundle = Bundle(for: type(of: self))
        
        sut = CardDetailView(frame: UIScreen.main.bounds)
        service = NetworkServiceStub(bundle: bundle)
        networkManager = NetworkManager(service: service)
        dataSource = .fixture(networkManager: networkManager)
//        isRecording = true
    }

    override func tearDown() {
        sut = nil
        dataSource = nil
        service = nil
        networkManager = nil
        super.tearDown()
    }

    func testCardsListWithCards() {
        sut.expansionNameLabel.text = "Khans of Tarkir"
        sut.detailCollectionView.dataSource = dataSource
        assertSnapshot(matching: sut, as: .image)
    }
    
}
