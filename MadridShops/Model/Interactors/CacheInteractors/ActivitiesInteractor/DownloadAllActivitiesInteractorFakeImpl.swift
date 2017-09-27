//
//  DownloadAllActivitiesInteractorFakeImpl.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 26/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import Foundation

class DownloadAllActivitiesInteractorFakeImpl : DownloadAllActivitiesInteractor {    
    func execute(onSuccess: @escaping (Activities) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    

    func execute(onSuccess: @escaping (Activities) -> Void, onError: errorClosure) {
        let activities = Activities()
        
        for i in 0...10 {
            let activity = Activity(name: "Activities number \(i)")
            activity.address = "Address \( 1 )"
            
            activities.add(activity: activity)
        }
        
        OperationQueue.main.addOperation {
            onSuccess(activities)
        }
    }
    
}
