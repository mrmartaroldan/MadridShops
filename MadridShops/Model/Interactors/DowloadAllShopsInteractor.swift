//
//  DowloadAllShopsInteractor.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 7/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import Foundation


protocol DownloadAllShopsInteractor {
    // execute: downloads all shops. Return on the main thread
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure)
    func execute(onSuccess: @escaping (Shops) -> Void)
}
