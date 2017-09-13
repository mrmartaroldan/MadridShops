//
//  ShopDetailViewController.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 13/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit

class ShopDetailViewController: UIViewController {

    var shop : Shop!
    
    @IBOutlet weak var shopDetailDescription: UITextView!
    
    @IBOutlet weak var shopImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.shop.name
        self.shopDetailDescription.text = self.shop.description
    }

}
