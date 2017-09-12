//
//  ViewController.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 7/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var shops: Shops?

    
    @IBOutlet weak var shopsCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let downloadShopsInteractor: DownloadAllShopsInteractor = DownloadAllShopsInteractorNSOpImpl()
        /*
         downloadShopsInteractor.execute(onSuccess: { (shops: Shops) in
            //todo OK
        }) {(error: Error) in
            //error
        }
        
        downloadShopsInteractor.execute(onSuccess: { (shops: Shops) in
            //todo OK
        })
         */
        
        
        downloadShopsInteractor.execute { (shops: Shops) in
            //todo OK
            print("Name: " + shops.get(index: 0).name)
            self.shops = shops
            
            self.shopsCollectionView.dataSource = self
            self.shopsCollectionView.delegate = self
        }
    }

}

