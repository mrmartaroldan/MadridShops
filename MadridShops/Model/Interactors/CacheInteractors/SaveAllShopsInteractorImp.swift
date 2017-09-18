//
//  SaveAllShopsInteractorImp.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 18/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import CoreData

class SaveAllShopsInteractorImp: SaveAllShopsInteractor {
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void, onError: errorClosure) {
        
        for i in 0..<shops.count() {
            let shop = shops.get(index: i)
            
            // Mapping shop into ShopCD
            let shopCD = ShopCD(context: context)
            shopCD.name = shop.name
            shopCD.address = shop.address
            shopCD.image = shop.image
            shopCD.logo = shop.logo
            /*
            shopCD.latitude = shop.latitude!
            shopCD.longitude = shop.longitude!
            shopCD.desc_en = shop.description
            shopCD.openingHours = shop.openingHours
             */
        }
        
        do {
            try context.save()
            onSuccess(shops)
        } catch {
            //onError(nil)
        }
    }
    
    func execute(shops shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void) {
        execute(shops: shops, context: context, onSuccess: onSuccess, onError: nil)
    }
    
    
}
