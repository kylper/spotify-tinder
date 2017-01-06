//
//  User.swift
//  Spotify Project
//
//  Created by Ethan Horing on 12/21/16.
//  Copyright © 2016 Ethan and Kyle. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase


struct User {
    let uid: String
    let email: String
    let acceptedSongs: [Song]
    let rejectedSongs: [Song]
    let key: String
    let ref: FIRDatabaseReference?


    
    init(authData: FIRUser) {
        uid = authData.uid
        email = authData.email!
        acceptedSongs = []
        rejectedSongs = []
        key = ""
        ref = nil
    }
    
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
        acceptedSongs = []
        rejectedSongs = []
        key = ""
        ref = nil

    }
    
    func getAcceptedSongs(snapshot: FIRDataSnapshot) -> [Song] {
        //key = snapshot.key
        
        let snapshotValue = snapshot.value as! [String: AnyObject]
        let accepted_songs = snapshotValue["acceptedSongs"] as! [Song]
        
        //ref = snapshot.ref
        
        return accepted_songs

    }
    
    func getRejectedSongs(snapshot: FIRDataSnapshot) -> [Song] {
        //key = snapshot.key
        
        let snapshotValue = snapshot.value as! [String: AnyObject]
        let rejected_songs = snapshotValue["rejectedSongs"] as! [Song]
        
        //ref = snapshot.ref
        
        return rejected_songs
        
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        
        self.uid = snapshotValue["uid"] as! String
        self.email = snapshotValue["email"] as! String
        self.acceptedSongs = snapshotValue["acceptedSongs"] as! [Song]
        self.rejectedSongs = snapshotValue["rejectedSongs"] as! [Song]
        ref = snapshot.ref
    }
    
    
    func toAnyObject() -> Any {
        return [
            "uid": uid,
            "email": email,
            "acceptedSongs": acceptedSongs,
            "rejectedSongs": rejectedSongs

        ]
    }
}
