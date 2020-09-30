//
//  ContentView.swift
//  Music App
//
//  Created by Abhishek Rawat on 30/09/20.
//  Copyright © 2020 Abe10. All rights reserved.
//

import SwiftUI

struct Album : Hashable {
    var id : UUID
    var name : String
    var image : String
    var songs : [Song]
}

struct Song : Hashable {
    var id : UUID
    var name : String
    var time : String
}

struct AlbumArt : View {
    var album : Album
    var body : some View {
        EmptyView()
    }
}

struct SongCell : View {
    var song : Song
    var body : some View {
        EmptyView()
    }
}

struct ContentView: View {
    
    var albums = [
        Album(id: UUID(), name: "Hybrid Theory", image: "Hybrid Theory", songs: [
            Song(id: UUID(), name: "Song 1", time: "3:54"),
            Song(id: UUID(), name: "Song 2", time: "4:51"),
            Song(id: UUID(), name: "Song 3", time: "3:24"),
            Song(id: UUID(), name: "Song 4", time: "4:11"),
        ]),
        Album(id: UUID(), name: "The Hunting Party", image: "The Hunting Party", songs: [
            Song(id: UUID(), name: "Song 5", time: "3:54"),
            Song(id: UUID(), name: "Song 6", time: "4:51"),
            Song(id: UUID(), name: "Song 7", time: "3:24"),
            Song(id: UUID(), name: "Song 8", time: "4:11"),
        ]),
        Album(id: UUID(), name: "One More Light", image: "One More Light", songs: [
            Song(id: UUID(), name: "Song 9", time: "3:54"),
            Song(id: UUID(), name: "Song 10", time: "4:51"),
            Song(id: UUID(), name: "Song 11", time: "3:24"),
            Song(id: UUID(), name: "Song 12", time: "4:11"),
        ]),
        Album(id: UUID(), name: "Minutes to Midnight", image: "Minutes to Midnight", songs: [
            Song(id: UUID(), name: "Song 13", time: "3:54"),
            Song(id: UUID(), name: "Song 14", time: "4:51"),
            Song(id: UUID(), name: "Song 15", time: "3:24"),
            Song(id: UUID(), name: "Song 16", time: "4:11"),
        ])]
    
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false, content: <#T##() -> _#>)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
