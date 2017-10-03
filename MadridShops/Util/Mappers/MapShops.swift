//
//  MapShops.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 18/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import Foundation
import CoreData

func mapShopCDIntoShop(shopCD: ShopCD) -> Shop {
    
    //Mapping shopCD into shop
    let shop = Shop(name: shopCD.name!)
    shop.address = shopCD.address ?? ""
    shop.image = shopCD.image ?? ""
    shop.logo = shopCD.logo ?? ""
    shop.latitude = shopCD.latitude
    shop.longitude = shopCD.longitude
    shop.description = shopCD.desc_en ?? ""
    shop.openingHours = shopCD.openingHours ?? ""
    
    /*
     ?? ""
     if let desc = shopCD.desc_en {
           shop.description = desc
     } else {
           shop.description = ""
     }
    */
    
    return shop
    
}

func mapShopIntoShopCD(context: NSManagedObjectContext, shop: Shop) -> ShopCD {
    
    //Mapping shop into shopCD
    let shopCD = ShopCD(context: context)
    shopCD.name = shop.name
    shopCD.address = shop.address
    shopCD.image = shop.image
    shopCD.logo = shop.logo
    shopCD.latitude = shop.latitude ?? 0.0
    shopCD.longitude = shop.longitude ?? 0.0
    shopCD.desc_en = shop.description
    shopCD.openingHours = shop.openingHours
    
    return shopCD
}
