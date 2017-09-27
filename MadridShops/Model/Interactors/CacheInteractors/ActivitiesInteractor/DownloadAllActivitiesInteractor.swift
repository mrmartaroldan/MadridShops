//
//  DownloadAllActivitiesInteractor.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 25/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import Foundation

protocol DownloadAllActivitiesInteractor {
    // execute: downloads all shops. Return on the main thread
    func execute(onSuccess: @escaping (Activities) -> Void, onError: errorClosure)
    func execute(onSuccess: @escaping (Activities) -> Void)
}
