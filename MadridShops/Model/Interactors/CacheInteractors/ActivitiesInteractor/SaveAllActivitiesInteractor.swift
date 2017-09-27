//
//  SaveAllActivitiesInteractor.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 26/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import Foundation
import CoreData

protocol SaveAllActivitiesInteractor {
    // execute: downloads all shops. Return on the main thread
    func execute(activities: Activities, context: NSManagedObjectContext, onSuccess: @escaping (Activities) -> Void, onError: errorClosure)
    func execute(activities: Activities, context: NSManagedObjectContext, onSuccess: @escaping (Activities) -> Void)
}
