//
//  MainViewController.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 12/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    var context : NSManagedObjectContext!
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    @IBOutlet weak var goToShop: UIBarButtonItem!
    @IBOutlet weak var goToActivity: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadIndicator.isHidden = true
        
        checkConnection()
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
    
    func loadData(){
        let downloadShopsInteractor: DownloadAllShopsInteractor = DownloadAllShopsInteractorNSURLSessionImpl()
        downloadShopsInteractor.execute { (shops: Shops) in
            
            let cacheInteractor = SaveAllShopsInteractorImp()
            cacheInteractor.execute(shops: shops, context: self.context, onSuccess: { (shops: Shops) in
            })

        }
            
        let downloadActivitiesInteractor: DownloadAllActivitiesInteractor = DownloadAllActivitiesInteractorNSURLSessionImpl()
        downloadActivitiesInteractor.execute { (activities: Activities) in
            
            
            let cacheInteractor = SaveAllActivitiesInteractorImp()
            cacheInteractor.execute(activities: activities, context: self.context, onSuccess: { (activities: Activities) in
            })

        }
                
        SetExecutedOnceInteractorImpl().execute()
        self.goToShop.isEnabled = true
        self.goToActivity.isEnabled = true
        self.loadIndicator.stopAnimating()
        self.loadIndicator.isHidden = true
    
    }
    
    func checkConnection() {
        ExecuteOnceInteractorImpl().execute {
            goToShop.isEnabled = false
            goToActivity.isEnabled = false
            self.loadIndicator.isHidden = false
            self.loadIndicator.startAnimating()
            let queue = OperationQueue()
            queue.addOperation {
                var statusConnection = Reachability.isConnectedToNetwork()
                while (statusConnection == false){
                    let alert = UIAlertController(title: "Without connection", message: "Check your connection", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Retry", style: UIAlertActionStyle.destructive, handler: { action in statusConnection = Reachability.isConnectedToNetwork() }))
                    self.present(alert, animated: true, completion: nil)
                }
                OperationQueue.main.addOperation {
                    self.loadData()
                }
            }
        }
    }
}
