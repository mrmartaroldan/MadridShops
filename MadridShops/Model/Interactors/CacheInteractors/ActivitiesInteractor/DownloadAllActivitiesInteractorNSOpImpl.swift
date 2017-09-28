//
//  DownloadAllActivitiesInteractorNSOpImpl.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 27/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import Foundation

class DownloadAllActivitiesInteractorNSOpImpl : DownloadAllActivitiesInteractor {
    func execute(onSuccess: @escaping (Activities) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    
    func execute(onSuccess: @escaping (Activities) -> Void, onError: errorClosure) {
        
        let urlString = "https://madrid-shops.com/json_new/getActivities.php"
        
        let queue = OperationQueue()
        queue.addOperation {
            
            if let url = URL(string: urlString), let data = NSData(contentsOf: url) as Data? {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>
                    let result = jsonObject["result"] as! [Dictionary<String, Any>]
                    
                    let activities = Activities()
                    
                    for activityJson in result {
                        let activity = Activity(name: activityJson["name"]! as! String)
                        activity.address = activityJson["address"] as! String
                        activity.logo = activityJson["logo_img"] as! String
                        activities.add(activity: activity)
                        
                    }
                    
                    OperationQueue.main.addOperation {
                        onSuccess(activities)
                    }
                    
                } catch {
                    
                }

            }
            
        }
        
    }
    
}

