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
        
        self.activitiesCollectionView.delegate = self
        self.activitiesCollectionView.dataSource = self
        
        addPinLocation()
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
    
    func addPinLocation(){
        
        let madridLocation = CLLocationCoordinate2DMake(40.41889,-3.69194)
        activityMap.setRegion(MKCoordinateRegionMakeWithDistance(madridLocation, 1500, 1500), animated: true)
        
        for i in 0 ..< self.fetchedResultsController.sections![0].numberOfObjects {
            let activity: ActivityCD = fetchedResultsController.object(at: IndexPath (row: i, section: 0))
            let location = CLLocation(latitude: Double(activity.latitude), longitude: Double(activity.longitude))
            let pinLocation = LocationMap(title: activity.name!, subtitle: activity.address!, coordinate: location.coordinate)


            activityMap.addAnnotation(pinLocation)
        }
    }
}




