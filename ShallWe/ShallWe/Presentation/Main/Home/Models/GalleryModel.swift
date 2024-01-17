//
//  GalleryModel.swift
//  ShallWe
//
//  Created by KJ on 12/6/23.
//

import UIKit

struct GalleryModel {
    let image: UIImage
}

extension GalleryModel {
    
    static func galleryDummydata() -> [GalleryModel] {
        return [
            GalleryModel(image: ImageLiterals.Home.img_ad1),
            GalleryModel(image: ImageLiterals.Home.img_ad2),
            GalleryModel(image: ImageLiterals.Home.img_ad1),
            GalleryModel(image: ImageLiterals.Home.img_ad2)
        ]
    }
}
