//
//  ActivityDetailViewController.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 28/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit

class ActivityDetailViewController: UIViewController {
    
    var activity: Activity?

    @IBOutlet weak var activityImage: UIImageView!
    @IBOutlet weak var activityDetailDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.activity?.name
        self.activityDetailDescription.text = self.activity?.description_en
        self.activity?.image.loadImage(into: activityImage)

    }

}
