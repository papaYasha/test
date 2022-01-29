//
//  unitTests.swift
//  unitTests
//
//  Created by Macbook on 28.01.22.
//

import XCTest
@testable import test

var sut: ImageService!

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
    
    func testSortHitsByLikes_Ascending() {
        let hits: [ImageItemResponse] = [
            ImageItemResponse.init(webformatURL: "", likes: 9, comments: 1, downloads: 1),
            ImageItemResponse.init(webformatURL: "", likes: 5, comments: 1, downloads: 1),
            ImageItemResponse.init(webformatURL: "", likes: 2, comments: 1, downloads: 1)
        ]
        
        let sortedByLikes = sut.sortByLikes_Ascending(hits)
        XCTAssertEqual(sortedByLikes[0].likes, 2)
        XCTAssertEqual(sortedByLikes[1].likes, 5)
        XCTAssertEqual(sortedByLikes[2].likes, 9)
        
    }
    
    func testSortHitsByComments_Ascending() {
        let hits: [ImageItemResponse] = [
            ImageItemResponse.init(webformatURL: "", likes: 1, comments: 8, downloads: 1),
            ImageItemResponse.init(webformatURL: "", likes: 1, comments: 3, downloads: 1),
            ImageItemResponse.init(webformatURL: "", likes: 1, comments: 5, downloads: 1)
        ]
        
        let sortedByLikes = sut.sortByComments_Ascending(hits)
        XCTAssertEqual(sortedByLikes[0].comments, 3)
        XCTAssertEqual(sortedByLikes[1].comments, 5)
        XCTAssertEqual(sortedByLikes[2].comments, 8)
        
    }
    
    func testSortHitsByDownloads_Descending() {
        let hits: [ImageItemResponse] = [
            ImageItemResponse.init(webformatURL: "", likes: 1, comments: 1, downloads: 2),
            ImageItemResponse.init(webformatURL: "", likes: 1, comments: 1, downloads: 3),
            ImageItemResponse.init(webformatURL: "", likes: 1, comments: 1, downloads: 1)
        ]
        
        let sortedByLikes = sut.sortByDownloads_Descending(hits)
        XCTAssertEqual(sortedByLikes[0].downloads, 3)
        XCTAssertEqual(sortedByLikes[1].downloads, 2)
        XCTAssertEqual(sortedByLikes[2].downloads, 1)
        
    }
}
