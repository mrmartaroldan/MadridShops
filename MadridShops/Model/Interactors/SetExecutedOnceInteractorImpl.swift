//
//  SetExecutedOnceInteractorImpl.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 18/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import Foundation

class SetExecutedOnceInteractorImpl: SetExecutedOnceInteractor {
    func execute() {
        let defaults = UserDefaults.standard
        
        defaults.set("SAVED", forKey: "once")
        
        defaults.synchronize()
    }
    
    
}
