//
//  ImageSort.swift
//  test
//
//  Created by Macbook on 27.01.22.
//

import UIKit

class ImageService {
    static let shared = ImageService()
    
    func sortByLikes_Ascending(_ hits: [ImageItemResponse]) -> [ImageItemResponse] {
        var hitsCopy = hits
        hitsCopy.sort(by: { $0.likes < $1.likes })
        return hitsCopy
    }
    
    func sortByComments_Ascending(_ hits: [ImageItemResponse]) -> [ImageItemResponse] {
        var hitsCopy = hits
        hitsCopy.sort(by: { $0.comments < $1.comments })
        return hitsCopy
    }
    
    func sortByDownloads_Descending(_ hits: [ImageItemResponse]) -> [ImageItemResponse] {
        var hitsCopy = hits
        hitsCopy.sort(by: { $0.downloads > $1.downloads })
        return hitsCopy
    }
    
    func isEmpty(_ hits: [ImageItemResponse]) -> Bool {
        hits.isEmpty
    }
}
