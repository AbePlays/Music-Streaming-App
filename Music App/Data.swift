//
//  Data.swift
//  Music App
//
//  Created by Abhishek Rawat on 02/10/20.
//  Copyright © 2020 Abe10. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase

class MusicData: ObservableObject {
    @Published public var albums = [Album]()
    
    func loadAlbums(){
        Firestore.firestore().collection("albums").getDocuments { (snapshot, error) in
            if error == nil {
                for document in snapshot!.documents {
                    let name = document.data()["name"] as? String ?? ""
                    let image = document.data()["image"] as? String ?? ""
                    let songs = document.data()["songs"] as? [String: [String : Any]]
                    
                    var songsArray = [Song]()
                    if let songs = songs {
                        for song in songs {
                            let songName = song.value["name"] as? String ?? ""
                            let songTime = song.value["time"] as? String ?? ""
                            songsArray.append(Song(id: UUID(), name: songName, time: songTime))
                        }
                    }
                    
                    self.albums.append(Album(id: UUID(), name: name, image: image, songs: songsArray))
                }
            } else {
                print(error)
            }
        }
    }
}
