//
//  ImageManager.swift
//  test
//
//  Created by Macbook on 27.01.22.
//

import UIKit

protocol ImageManagerDelegate {
    func didFailWithError()
    func showAlert()
}

struct ImageManager {
    
    //MARK: - var, let
    
    var delegate: ImageManagerDelegate?
    
    //MARK: - Functions
    
    func loadImagesInfo(handler: @escaping(ImageData) -> Void) {
        if let url = URL(string: K.urlString) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    delegate?.didFailWithError()
                    print(error?.localizedDescription ?? "!error!")
                    return
                }
                do {
                    let mapped = try JSONDecoder().decode(ImageData.self, from: data)
                    DispatchQueue.main.async {
                        handler(mapped)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            task.resume()
        }
    }
    
    func loadImage(model: ImageItemResponse, handler: @escaping(UIImage) -> Void) {
        if let url = URL(string: model.webformatURL) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    return
                }
                
                if error != nil {
                    print(error?.localizedDescription ?? "!error_1!")
                    return
                }
                
                if let uiImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        handler(uiImage)
                    }
                } else {
                    print(error?.localizedDescription ?? "!error_2!")
                }
            }
            task.resume()
        }
    }
}
