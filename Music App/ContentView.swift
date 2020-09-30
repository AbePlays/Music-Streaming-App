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
        ZStack(alignment: .bottom, content: {
            Image(album.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 170, height: 200, alignment: .center)
            ZStack {
                Blur(style: .dark)
                Text(album.name).foregroundColor(.white)
            }.frame(height: 60, alignment: .center)
        }).frame(width: 170, height: 200, alignment: .center).clipped().cornerRadius(20).shadow(radius: 10).padding(20)
    }
}

struct SongCell : View {
    var song : Song
    var body : some View {
        HStack {
            ZStack {
                Circle().frame(width: 50, height: 50, alignment: .center).foregroundColor(.blue)

                Circle().frame(width: 20, height: 20, alignment: .center).foregroundColor(.white)
            }
            Text(song.name).bold()
            Spacer()
            Text(song.time)
        }.padding(20)
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
    
    @State private var currentAlbum : Album?
    
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack {
                        ForEach(self.albums, id: \.self, content: {
                            album in
                            AlbumArt(album: album).onTapGesture {
                                self.currentAlbum = album
                            }
                        })
                    }
                })
                VStack {
                    ForEach((self.currentAlbum?.songs ?? self.albums.first?.songs) ?? [
                        Song(id: UUID(), name: "Song 1", time: "3:54"),
                        Song(id: UUID(), name: "Song 2", time: "4:51"),
                        Song(id: UUID(), name: "Song 3", time: "3:24"),
                        Song(id: UUID(), name: "Song 4", time: "4:11"),
                        ], id: \.self, content: {
                            song in
                            SongCell(song: song)
                    })
                }
            }.navigationBarTitle("Linkin Park")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
