//
//  ExecuteOnce.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 18/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import Foundation

protocol ExecuteOnceInteractor {

    func execute(closure: () -> Void)
}
