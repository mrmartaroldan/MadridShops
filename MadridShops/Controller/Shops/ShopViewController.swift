//
//  ShopViewController.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 7/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation
import MapKit

class ShopViewController: UIViewController, CLLocationManagerDelegate {
    
    var context: NSManagedObjectContext!
    
    @IBOutlet weak var shopsCollectionView: UICollectionView!
    
    @IBOutlet weak var map: MKMapView!
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        
        self.shopsCollectionView.delegate = self
        self.shopsCollectionView.dataSource = self
        
        addPinLocation()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let shop: ShopCD = self.fetchedResultsController.object(at: indexPath)
        self.performSegue(withIdentifier: "ShowShopDetailSegue", sender: shop)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "ShowShopDetailSegue" {
            let vc = segue.destination as! ShopDetailViewController

            let shopCD: ShopCD = sender as! ShopCD
            vc.shop = mapShopCDIntoShop(shopCD: shopCD)
        }
    }
    
    //MARK: - Fetched results controller
    
    var _fetchedResultsController: NSFetchedResultsController<ShopCD>? = nil
    
    var fetchedResultsController:NSFetchedResultsController<ShopCD> {
        if _fetchedResultsController != nil{
            return _fetchedResultsController!
        }
        
        let fetchRequest: NSFetchRequest<ShopCD> = ShopCD.fetchRequest()
        
        fetchRequest.fetchBatchSize = 20
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        _fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,              managedObjectContext: self.context!,
            sectionNameKeyPath: nil, cacheName: "ShopCacheFile")
        
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
        self.map.setCenter(location.coordinate, animated: true)
    }
    
    func addPinLocation(){
        
        let madridLocation = CLLocationCoordinate2DMake(40.41889,-3.69194)
        map.setRegion(MKCoordinateRegionMakeWithDistance(madridLocation, 1500, 1500), animated: true)
        
        for i in 0 ..< self.fetchedResultsController.sections![0].numberOfObjects {
            let shop: ShopCD = fetchedResultsController.object(at: IndexPath (row: i, section: 0))
            let location = CLLocation(latitude: Double(shop.latitude), longitude: Double(shop.longitude))
            let pinLocation = LocationMap(title: shop.name!, subtitle: shop.address!, coordinate: location.coordinate)
            map.addAnnotation(pinLocation)
        }
    }
}

