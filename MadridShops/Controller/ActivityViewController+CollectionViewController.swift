//
//  ActivityViewController+CollectionViewController.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 27/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit

extension ActivityViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.activities?.count())!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : ActivityCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActivityCell", for: indexPath) as! ActivityCell
        
        let activity : Activity = (self.activities?.get(index: indexPath.row))!
        
        cell.refresh(activity: activity)
        
        return cell
    }
    
    
}
    

