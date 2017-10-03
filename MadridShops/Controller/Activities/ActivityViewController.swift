//
//  ActivityViewController.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 26/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation
import MapKit

class ActivityViewController : UIViewController, CLLocationManagerDelegate {
    
    var context: NSManagedObjectContext!
    let locationManager = CLLocationManager()

    @IBOutlet weak var activitiesCollectionView: UICollectionView!
    @IBOutlet weak var activityMap: MKMapView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        
        ExecuteOnceInteractorImpl().execute {
           initializeData()
        }
        
        self.activitiesCollectionView.delegate = self
        self.activitiesCollectionView.dataSource = self
        //let madridLocation = CLLocation(latitude:40.4379332, longitude: -3.7495761)
        //self.activityMap.setCenter(madridLocation.coordinate, animated: true)
    }
    
    func initializeData() {
        let downloadActivitiesInteractor: DownloadAllActivitiesInteractor = DownloadAllActivitiesInteractorNSURLSessionImpl()
        
        downloadActivitiesInteractor.execute { (activities: Activities) in
            
            let cacheInteractor = SaveAllActivitiesInteractorImp()
            cacheInteractor.execute(activities: activities, context: self.context, onSuccess: { (activities: Activities) in
                SetExecutedOnceInteractorImpl().execute()
                
                self._fetchedResultsController = nil
                self.activitiesCollectionView.delegate = self
                self.activitiesCollectionView.dataSource = self
                self.activitiesCollectionView.reloadData()
                
            })
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let activity: ActivityCD = self.fetchedResultsController.object(at: indexPath)
        self.performSegue(withIdentifier: "ShowActivityDetailSegue", sender: activity)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowActivityDetailSegue" {
            let vc = segue.destination as! ActivityDetailViewController
            
            let activityCD: ActivityCD = sender as! ActivityCD
            vc.activity = mapActivityCDIntoActivity(activityCD: activityCD)
        }
    }
    
    //MARK: - Fetched results controller
    
    var _fetchedResultsController: NSFetchedResultsController<ActivityCD>? = nil
    
    var fetchedResultsController:NSFetchedResultsController<ActivityCD> {
        if _fetchedResultsController != nil{
            return _fetchedResultsController!
        }
        
        let fetchRequest: NSFetchRequest<ActivityCD> = ActivityCD.fetchRequest()
        fetchRequest.fetchBatchSize = 20
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        _fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,              managedObjectContext: self.context!,
            sectionNameKeyPath: nil, cacheName: "ActivityCacheFile")
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        self.activityMap.setCenter(location.coordinate, animated: true)
    }
}




