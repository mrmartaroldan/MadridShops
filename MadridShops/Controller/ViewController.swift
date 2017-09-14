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
        
        let downloadShopsInteractor: DownloadAllShopsInteractor = DownloadAllShopsInteractorNSURLSessionImpl()
        
        /*let downloadShopsInteractor: DownloadAllShopsInteractor = DownloadAllShopsInteractorNSOpImpl()
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let shop = self.shops?.get(index: indexPath.row)
        self.performSegue(withIdentifier: "ShowShopDetailSegue", sender: shop)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "ShowShopDetailSegue" {
            let vc = segue.destination as! ShopDetailViewController
            
            //let indexPath = self.shopsCollectionView.indexPathsForSelectedItems![0]
            //let shop = self.shops?.get(index: indexPath.row)
            vc.shop = sender as! Shop
        }
    }

}

