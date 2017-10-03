//
//  MainViewController.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 12/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit
import FillableLoaders
import CoreData

class MainViewController: UIViewController {
    
    var context : NSManagedObjectContext!
    
    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopsSegue" {
            let vc = segue.destination as! ShopViewController
            vc.context = self.context
        }
        
        if segue.identifier == "ShowActivitiesSegue" {
            let vc = segue.destination as! ActivityViewController
            vc.context = self.context
        }
    }
    
    func loadImage(){
        
        let imageUrl = "https://lh3.googleusercontent.com/D19LI6ofUo46u5Bl_-S_8_dArgDJfrZAfPhVQ6Y4GuMEVBbkLkSqIAR1tvGAH0mm-04=w300"
        
        assert(imageUrl.lengthOfBytes(using: String.Encoding.utf8) > 0)
        
        if let url = URL(string: imageUrl),
            let data = NSData(contentsOf: url){
            let image = UIImage(data: data as Data)
            
            DispatchQueue.main.async {
                self.logo.image = image
            }
            
        }
    }
    

}
