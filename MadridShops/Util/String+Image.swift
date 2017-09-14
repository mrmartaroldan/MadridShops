//
//  String+Image.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 14/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit

extension String {
    func loadImage(into imageView: UIImageView){
        let queue = OperationQueue()
        queue.addOperation {
            if let url = URL(string: self),
                let data = NSData(contentsOf: url),
                let image = UIImage(data: data as Data) {
                
                OperationQueue.main.addOperation {
                    imageView.image = image
                }
            }
        }
    }
}
