//
//  ImageData.swift
//  test
//
//  Created by Macbook on 27.01.22.
//

struct ImageData: Codable {
    var hits: [ImageItemResponse]
}

struct ImageItemResponse: Codable {
    var webformatURL: String
    var likes: Int
    var comments: Int
    var downloads: Int
}
