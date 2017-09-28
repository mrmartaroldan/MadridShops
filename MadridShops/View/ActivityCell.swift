//
//  ActivityCell.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 27/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit

class ActivityCell: UICollectionViewCell {
    var activity: Activity?
    
    @IBOutlet weak var activityImageViewCell: UIImageView!
    @IBOutlet weak var activityLabelCell: UILabel!
    
    func refresh(activity: Activity){
        self.activity = activity
        
        self.activityLabelCell.text = activity.name
        self.activity?.logo.loadImage(into: activityImageViewCell)
        activityImageViewCell.clipsToBounds = true
        UIView.animate(withDuration: 1.0){
            self.activityImageViewCell.layer.cornerRadius = 30
        }
    }


}
