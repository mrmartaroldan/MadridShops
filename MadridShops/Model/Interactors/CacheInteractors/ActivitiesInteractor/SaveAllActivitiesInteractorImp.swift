//
//  SaveAllActivitiesInteractorImp.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 26/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import CoreData

class SaveAllActivitiesInteractorImp: SaveAllActivitiesInteractor {
    func execute(activities: Activities, context: NSManagedObjectContext, onSuccess: @escaping (Activities) -> Void, onError: errorClosure) {
        
        for i in 0..<activities.count() {
            let activity = activities.get(index: i)
            
            //let _ = mapActivityIntoActivityCD(context: context, activity: activity)
        }
        
        do {
            try context.save()
            onSuccess(activities)
        } catch {
            //onError(nil)
        }
    }
    
    func execute(activities: Activities, context: NSManagedObjectContext, onSuccess: @escaping (Activities) -> Void) {
        execute(activities: activities, context: context, onSuccess: onSuccess, onError: nil)
    }
    
    
}
