//
//  Activity.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 25/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import Foundation

public class Activity{
    var name: String
    var image: String = ""
    var logo: String = ""
    var openingHours: String = ""
    var address : String = ""
    var description_en : String = ""
    var latitude: Float? = nil
    var longitude: Float? = nil
    
    public init(name: String) {
        self.name = name
    }
}
