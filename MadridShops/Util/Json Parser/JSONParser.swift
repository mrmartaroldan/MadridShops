//
//  JSONParser.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 13/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import Foundation
import CoreData

func parseShops(data: Data) -> Shops {
    let shops = Shops()
    do{
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>
        let result = jsonObject["result"] as! [Dictionary<String, Any>]
        
        for shopJson in result {
            let shop = Shop(name: (shopJson["name"]! as? String)!)
            shop.address = shopJson["address"]! as! String
            shop.logo = shopJson["logo_img"] as! String
            shop.image = shopJson["img"]! as! String
            shop.description = shopJson["description_en"] as! String
            
            let latitude = (shopJson["gps_lat"]! as! String).trimmingCharacters(in: NSCharacterSet.whitespaces).replacingOccurrences(of: ",", with: "")
            shop.latitude = Float(latitude)!
            
            let longitude = (shopJson["gps_lon"]! as! String).trimmingCharacters(in: NSCharacterSet.whitespaces).replacingOccurrences(of: ",", with: "")
            shop.longitude = Float(longitude)!
            
            
            shops.add(shop: shop)
        }
    } catch {
        print("Error parsing shop JSON")
    }
    
    return shops
}

func parseActivities(data: Data) -> Activities {
    let activities = Activities()
    do{
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>
        let result = jsonObject["result"] as! [Dictionary<String, Any>]
        
        for activityJson in result {
            let activity = Activity(name: activityJson["name"]! as! String)
            activity .address = activityJson["address"]! as! String
            activity .logo = activityJson["logo_img"] as! String
            activity .image = activityJson["img"]! as! String
            activity .description_en = activityJson["description_en"] as! String
            
            let latitude = (activityJson["gps_lat"]! as! String).trimmingCharacters(in: NSCharacterSet.whitespaces).replacingOccurrences(of: ",", with: "")
            activity.latitude = Float(latitude)!
            
            let longitude = (activityJson["gps_lon"]! as! String).trimmingCharacters(in: NSCharacterSet.whitespaces).replacingOccurrences(of: ",", with: "")
            activity.longitude = Float(longitude)!
            
            activities.add(activity: activity)
        }
    } catch {
        print("Error parsing activity JSON")
    }
    
    return activities
}
