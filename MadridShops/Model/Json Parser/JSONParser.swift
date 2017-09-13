//
//  JSONParser.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 13/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import Foundation

func parseShops(data: Data) -> Shops {
    let shops = Shops()
    do{
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>
        let result = jsonObject["result"] as! [Dictionary<String, Any>]
        
        for shopJson in result {
            let shop = Shop(name: shopJson["name"]! as! String)
            shop.address = shopJson["address"]! as! String
            
            shops.add(shop: shop)
        }
    } catch {
        print("Error parsing JSON")
    }
    
    return shops
}