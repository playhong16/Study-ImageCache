//
//  Extension.swift
//  ImageCache
//
//  Created by playhong on 2023/10/30.
//

import UIKit

extension UIImageView {
    func setImageURL(_ url: String) {
        DispatchQueue.global().async {
            guard let url = URL(string: url) else { return }
            URLSession.shared.dataTask(with: url) { (data, result, error) in
                if error != nil {
                    DispatchQueue.main.async { [weak self] in
                        self?.image = UIImage()
                    }
                }
                
                DispatchQueue.main.async { [weak self] in
                    if let data = data, let image = UIImage(data: data) {
                        self?.image = image
                    }
                }
            }.resume()
        }
    }
    
    func setImageURLToCache(_ url: String) {
        DispatchQueue.global().async {
            let cachedKey = NSString(string: url)
            
            if let cachedImage = ImageCacheManager.shared.object(forKey: cachedKey) {
                DispatchQueue.main.async {
                    self.image = cachedImage
                    return
                }
            }
            
            guard let url = URL(string: url) else { return }
            URLSession.shared.dataTask(with: url) { (data, result, error) in
                if error != nil {
                    DispatchQueue.main.async { [weak self] in
                        self?.image = UIImage()
                    }
                }
                
                DispatchQueue.main.async { [weak self] in
                    if let data = data, let image = UIImage(data: data) {
                        ImageCacheManager.shared.setObject(image, forKey: cachedKey)
                        self?.image = image
                    }
                }
            }.resume()
        }
    }
}
