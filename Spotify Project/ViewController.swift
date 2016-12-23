//
//  ViewController.swift
//  SwipeDemo
//
//  Created by Ethan Horing on 12/10/16.
//  Copyright © 2016 Ethan Horing. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth

class ViewController: UIViewController {

    
    enum CardSaveType {
        case unseen, accepted, rejected
    }
    
    let allSongsRef = FIRDatabase.database().reference(withPath: "all-songs")
    let userRef = FIRDatabase.database().reference(withPath: "user")


    var songCards: [Song] = []
    
    /*
    var cards: [String: CardSaveType] = ["Kyle" : CardSaveType.unseen, "Ethan" : CardSaveType.unseen, "Bob" : CardSaveType.unseen, "Joe" : CardSaveType.unseen, "Kate" : CardSaveType.unseen, "Dave": CardSaveType.unseen, "Derek": CardSaveType.unseen, "Sara": CardSaveType.unseen] */
    
    
    var acceptedSongs: [Song] = []
    var rejectedSongs: [Song] = []
    
    
    // move this

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //var user = FIRAuth.auth()?.currentUser;
        //changeRequest?.
        
        
        
        
        
        
        allSongsRef.observe(.value, with: { snapshot in
            var newItems: [Song] = []
            
            for item in snapshot.children {
                let songItem = Song(snapshot: item as! FIRDataSnapshot)
                newItems.append(songItem)
                print("yo ", songItem)
            }
            
         
            print("hereagain ",newItems.count)
            self.songCards = newItems
            
        
        
        
        // picks a random song from all the songs (it might already be a seen song)
        let randomIndex = Int(arc4random_uniform(UInt32(self.songCards.count)))
        print("here: ",  self.songCards.count)
        let songTitle: String = self.songCards[randomIndex].title
        
        
        let label = UILabel(frame: CGRect(x: self.view.bounds.width / 2 - 100, y: self.view.bounds.height/2 - 50, width: 200, height: 100))

        label.text = songTitle
        label.textAlignment = NSTextAlignment.center
        self.view.addSubview(label)
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.wasDragged(_:)))
        label.addGestureRecognizer(gesture)
        
        label.isUserInteractionEnabled = true
        
            })
    }
    
    func wasDragged(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.view)
        let label = gesture.view!
        
        label.center = CGPoint(x: self.view.bounds.width/2 + translation.x, y: self.view.bounds.height/2 + translation.y)
        
        let xFromCenter = label.center.x - self.view.bounds.width / 2
        
        let scale = min(100 / abs(xFromCenter), 1)
        
        var rotation = CGAffineTransform(rotationAngle: xFromCenter / 200) // 1 radian
        var stretch = rotation.scaledBy(x: scale, y: scale)
        label.transform = stretch

        if gesture.state == UIGestureRecognizerState.ended {
            if (label.center.x < 100) {
                print ("Not chosen")
            }
            
            else if (label.center.x > self.view.bounds.width - 100) {
                print ("Chosen")
            }
            
            rotation = CGAffineTransform(rotationAngle: 0)
            stretch = rotation.scaledBy(x: 1, y: 1)
            label.transform = stretch
            label.center = CGPoint(x: view.bounds.width/2, y: view.bounds.height/2)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

