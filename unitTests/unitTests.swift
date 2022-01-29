//
//  unitTests.swift
//  unitTests
//
//  Created by Macbook on 28.01.22.
//

import XCTest
@testable import test

var sut: ImageService!
var contentVc = ContentVC()

class unitTests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ImageService()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testHitsEmpty() {
        //arrange
        let hits: [ImageItemResponse] = []
        //act
        let isEmpty = sut.isEmpty(hits)
        //assert
        XCTAssertEqual(isEmpty, true)
    }
    
    func testSortHitsByLikes_Increase() {
        let hits = [ImageItemResponse]()
        var hitsByLikes = sut.sortByLikes(hits)
        
    }
}
