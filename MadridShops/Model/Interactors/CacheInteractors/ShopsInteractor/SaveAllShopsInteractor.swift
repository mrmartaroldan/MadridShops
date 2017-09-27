//
//  SaveAllShopsInteractor.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 18/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import Foundation
import CoreData

protocol SaveAllShopsInteractor {
    // execute: downloads all shops. Return on the main thread
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void, onError: errorClosure)
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void)
}
