//
//  DownloadAllShopsInteractorNSURLSessionImpl.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 13/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import Foundation

class DownloadAllShopsInteractorNSURLSessionImpl: DownloadAllShopsInteractor {
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure) {
        let urlString = "https://madrid-shops.com/json_new/getShops.php"
        
        let session = URLSession.shared
        if let url = URL(string: urlString) {
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in

                    OperationQueue.main.addOperation {
                        if error == nil {
                            //OK
                            assert(Thread.current == Thread.main)
                            let shops = parseShops(data: data!)
                            onSuccess(shops)
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
    
    func execute(onSuccess: @escaping (Shops) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    
}
