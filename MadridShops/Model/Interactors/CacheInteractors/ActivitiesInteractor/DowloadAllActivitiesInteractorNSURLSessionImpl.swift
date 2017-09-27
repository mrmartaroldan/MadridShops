//
//  DownloadAllActivitiesInteractorNSURLSessionImpl.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 25/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import Foundation

class DownloadAllActivitiesInteractorNSURLSessionImpl: DownloadAllActivitiesInteractor {
    func execute(onSuccess: @escaping (Activities) -> Void, onError: errorClosure) {
        let urlString = "http://madrid-shops.com/json_new/getActivities.php"
        
        let session = URLSession.shared
        if let url = URL(string: urlString) {
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                
                OperationQueue.main.addOperation {
                    if error == nil {
                        //OK
                        assert(Thread.current == Thread.main)
                        let activities = parseActivities(data: data!)
                        onSuccess(activities)
                    } else {
                        //Error
                        if let myError = onError {
                            myError(error!)
                        }
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func execute(onSuccess: @escaping (Activities) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    
}
