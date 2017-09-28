//
//  ActivityViewController.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 26/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit

class ActivityViewController : UIViewController {
    
    var activities: Activities?
    
    
    @IBOutlet weak var activitiesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let downloadActivitiesInteractor: DownloadAllActivitiesInteractor = DownloadAllActivitiesInteractorNSURLSessionImpl()
        
        downloadActivitiesInteractor.execute { (activities: Activities) in
            
           print (activities.get(index: 0).name)
           self.activities = activities
            
           self.activitiesCollectionView.delegate = self
           self.activitiesCollectionView.dataSource = self
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowActivityDetailSegue" {
            let vc = segue.destination as! ActivityDetailViewController
            
            let indexPath = self.activitiesCollectionView.indexPathsForSelectedItems![0]
            let activity = self.activities?.get(index: indexPath.row)
            vc.activity = activity
        }
    }

}
