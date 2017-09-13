//
//  DownloadAllShopsInteractorNSOpImpl.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 12/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import Foundation

class DownloadAllShopsInteractorNSOpImpl: DownloadAllShopsInteractor {
    func execute(onSuccess: @escaping (Shops) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure = nil) {
        
        let urlString = "https://madrid-shops.com/json_new/getShops.php"
        
        let queue = OperationQueue()
        queue.addOperation {
    
            if let url = URL(string: urlString), let data = NSData(contentsOf: url) as Data? {
                
                let shops = parseShops(data: data)
                
                OperationQueue.main.addOperation {
                    onSuccess(shops)
                }
                    
            }
        }
    }
}
