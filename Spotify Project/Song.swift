//
//  Song.swift
//  Spotify Project
//
//  Created by Ethan Horing on 12/21/16.
//  Copyright © 2016 Ethan and Kyle. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct Song {
    let artist: String
    let title: String
    let id: String
    let pictureUrl: String
    let key: String
    let ref: FIRDatabaseReference?

    init(artist: String, title: String, id: String, url: String) {
        self.artist = artist
        self.title = title
        self.id = id
        self.pictureUrl = url
        key = ""
        self.ref = nil
    }
    
    
    init() {
        self.artist = ""
        self.title = ""
        self.id = ""
        self.pictureUrl = ""
        key = ""
        self.ref = nil

    }
    
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        self.artist = snapshotValue["artist"] as! String
        self.title = snapshotValue["title"] as! String
        self.id = snapshotValue["id"] as! String
        self.pictureUrl = snapshotValue["pictureUrl"] as! String
        ref = snapshot.ref
    }
    
}
