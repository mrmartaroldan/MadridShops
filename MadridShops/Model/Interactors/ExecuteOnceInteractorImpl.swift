//
//  ExecuteOnceInteractorImpl.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 18/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import Foundation

class ExecuteOnceInteractorImpl: ExecuteOnceInteractor {
    func execute(closure: () -> Void) {
        let defaults = UserDefaults.standard
        
        if let _ = defaults.string(forKey: "once") {
            // alredy saved
        } else {
            closure()
        }
    }
}
