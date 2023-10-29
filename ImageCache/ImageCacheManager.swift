//
//  ImageCacheManager.swift
//  ImageCache
//
//  Created by playhong on 2023/10/30.
//

import UIKit

final class ImageCacheManager {
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
}
