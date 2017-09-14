//
//  ShopCell.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 11/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit

class ShopCell: UICollectionViewCell {
    var shop: Shop?
    
    @IBOutlet weak var imageViewCell: UIImageView!
    
    @IBOutlet weak var labelCell: UILabel!
    
    func refresh(shop: Shop){
        self.shop = shop
        
        self.labelCell.text = shop.name
        self.shop?.logo.loadImage(into: imageViewCell)
        imageViewCell.clipsToBounds = true
        UIView.animate(withDuration: 1.0){
            self.imageViewCell.layer.cornerRadius = 30
        }
    }
    
}
