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
            
            let _ = mapShopIntoShopCD(context: context, shop: shop)
        }
        
        do {
            try context.save()
            onSuccess(shops)
        } catch {
            //onError(nil)
        }
    }
    
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void) {
        execute(shops: shops, context: context, onSuccess: onSuccess, onError: nil)
    }
    
    
}
