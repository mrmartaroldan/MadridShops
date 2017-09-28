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

                let activities = parseActivities(data: data)
                    
                    OperationQueue.main.addOperation {
                        onSuccess(activities)
                    }
            }
        }
    }
    
}

