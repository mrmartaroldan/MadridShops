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
    var myLoader : WavesLoader?
    
    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Star Drawing
        let starPath = UIBezierPath()
        starPath.move(to: CGPoint(x: 180, y: 25))
        starPath.addLine(to: CGPoint(x: 195.16, y: 43.53))
        starPath.addLine(to: CGPoint(x: 220.9, y: 49.88))
        starPath.addLine(to: CGPoint(x: 204.54, y: 67.67))
        starPath.addLine(to: CGPoint(x: 205.27, y: 90.12))
        starPath.addLine(to: CGPoint(x: 180, y: 82.6))
        starPath.addLine(to: CGPoint(x: 154.73, y: 90.12))
        starPath.addLine(to: CGPoint(x: 155.46, y: 67.67))
        starPath.addLine(to: CGPoint(x: 139.1, y: 49.88))
        starPath.addLine(to: CGPoint(x: 164.84, y: 43.53))
        starPath.close()
        starPath.fill()
        
        let myPath = starPath.cgPath
        self.myLoader = WavesLoader.showLoader(with: myPath)
        self.view.addSubview(self.myLoader!)
        
        // Gesture Recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(animateView))
        //Número de dedos
        tapGesture.numberOfTouchesRequired = 1
        //Veces que los dedos golpean la pantalla
        tapGesture.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(tapGesture)
        
        
        // Swipe gesture recognizer
        let swipeleft = UISwipeGestureRecognizer(target: self, action: #selector(restoreView))
        swipeleft.direction = .left
        self.view.addGestureRecognizer(swipeleft)
    }
    
    @objc func animateView() {
        UIView.animate(withDuration: 2.0) {
            if let v = self.myLoader{
                let newFrame = CGRect(x: v.frame.origin.x,
                                      y: v.frame.origin.y + 800,
                                      width: v.frame.size.width,
                                      height: v.frame.size.height)
                v.frame = newFrame
            }
            
            self.loadImage()
            //self.redRectangle.layer.cornerRadius = 15
            //self.redRectangle.backgroundColor = UIColor.clear
        }
    }
    
    @objc func restoreView(){
        UIView.animate(withDuration: 2.0, animations: {
            if let v = self.myLoader{
                let newFrame = CGRect(x: 0,
                                      y: 0,
                                      width: v.frame.size.width,
                                      height: v.frame.size.height)
                v.frame = newFrame
            }
        }) { (stop: Bool) in
            
            UIView.animate(withDuration: 1.0, animations: {
               //self.redRectangle.layer.cornerRadius = 0
                //self.redRectangle.backgroundColor = UIColor.red
            })
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopsSegue" {
            let vc = segue.destination as! ViewController
            vc.context = self.context
        }
    }
    
    func loadImage(){
        //assert(Thread.current != Thread.main)
        //print(Thread.current.description)
        
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
