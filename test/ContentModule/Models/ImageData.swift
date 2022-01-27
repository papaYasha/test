//
//  ImageData.swift
//  test
//
//  Created by Macbook on 27.01.22.
//

struct ImageData: Codable {
    let hits: [ImageItemResponse]
}

struct ImageItemResponse: Codable {
    let webformatURL: String
    let likes: Int
    let comments: Int
    let downloads: Int
}
