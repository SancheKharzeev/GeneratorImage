//
//  ImageDownload.swift
//  GeneratorImage
//
//  Created by Александр Х on 31.05.2023.
//

import UIKit

protocol ImageManagerDelegate {
    func didUpdateImage(_ image: Data)
    func didFailWithError(error: Error)
}

final class ImageDownload {
    let queue = DispatchQueue.global(qos: .utility)
    let api = "https://dummyimage.com/300x300/d9d5d9/1a1a1a.png&text="
    var delegate: ImageManagerDelegate?
    
    func fetchURL(words: String) {
        let urlString = "\(api)\(words)"
        print(urlString)
        performRequest(with: urlString)
    }
    
    // MARK: - Download IMG and DispatchQueue
    func performRequest(with urlString: String) {
        print("performRequest URL")
        if let apiURL = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            // уводим загрузку изображения на поток утилити
            queue.async(flags: .barrier) {
                let task = session.dataTask(with: apiURL) { (data, response, error) in
                    if error != nil {
                        self.delegate?.didFailWithError(error: error!)
                        return
                    }
                    // в основном потоке осуществляем работу с UI
                    DispatchQueue.main.async {
                        if let safeData = data {
                            self.delegate?.didUpdateImage(safeData)
                            print("получил изображение")
                        }
                    }
                }
                task.resume()
            }
        }
    }
}
