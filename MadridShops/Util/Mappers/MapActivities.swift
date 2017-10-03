//
//  MapActivities.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 26/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import Foundation
import CoreData

func mapActivityCDIntoActivity(activityCD: ActivityCD) -> Activity {
    
    //Mapping activityCD into Activity
    let activity = Activity(name: activityCD.name!)
    activity.address = activityCD.address ?? ""
    activity.image = activityCD.image ?? ""
    activity.logo = activityCD.logo ?? ""
    activity.latitude = activityCD.latitude
    activity.longitude = activityCD.longitude
    activity.description_en = activityCD.description_en ?? ""
    activity.openingHours = activityCD.openingHours ?? ""

    return activity
    
}

func mapActivityIntoActivityCD(context: NSManagedObjectContext, activity: Activity) -> ActivityCD {
    
    //Mapping Activity into ActivityCD
    let activityCD = ActivityCD(context: context)
    activityCD.name = activity.name
    activityCD.address = activity.address
    activityCD.image = activity.image
    activityCD.logo = activity.logo
    activityCD.latitude = activity.latitude ?? 0.0
    activityCD.longitude = activity.longitude ?? 0.0
    activityCD.description_en = activity.description_en
    activityCD.openingHours = activity.openingHours
    
    return activityCD
}

