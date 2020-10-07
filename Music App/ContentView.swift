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
    var file : String
}

struct AlbumArt : View {
    var album : Album
    var isWithText : Bool
    var body : some View {
        ZStack(alignment: .bottom, content: {
            Image(album.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 170, height: 200, alignment: .center)
            if isWithText == true {
                ZStack {
                    Blur(style: .dark)
                    Text(album.name).foregroundColor(.white)
                }.frame(height: 60, alignment: .center)
            }
        }).frame(width: 170, height: 200, alignment: .center).clipped().cornerRadius(20).shadow(radius: 10).padding(20)
    }
}

struct SongCell : View {
    var album : Album
    var song : Song
    var body : some View {
        NavigationLink(destination: PlayerView(album: album, song: song), label: {
            HStack {
                ZStack {
                    Circle().frame(width: 50, height: 50, alignment: .center).foregroundColor(.blue)
                    Circle().frame(width: 20, height: 20, alignment: .center).foregroundColor(.white)
                }
                .padding(.trailing, 20)
                Text(song.name).bold()
                Spacer()
                Text(song.time)
            }.padding(.horizontal, 20)
                .padding(.vertical, 10)
        }).buttonStyle(PlainButtonStyle())
    }
}

struct ContentView: View {
    
    @ObservedObject var data : MusicData
    
    @State private var currentAlbum : Album?
    
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack {
                        ForEach(self.data.albums, id: \.self, content: {
                            album in
                            AlbumArt(album: album, isWithText: true).onTapGesture {
                                self.currentAlbum = album
                            }
                        })
                    }
                })
                VStack {
                    if self.data.albums.first == nil {
                        EmptyView()
                    } else {
                        ForEach((self.currentAlbum?.songs ?? self.data.albums.first?.songs) ?? [
                            Song(id: UUID(), name: "Song 1", time: "3:54", file: ""),
                            Song(id: UUID(), name: "Song 2", time: "4:51", file: ""),
                            Song(id: UUID(), name: "Song 3", time: "3:24", file: ""),
                            Song(id: UUID(), name: "Song 4", time: "4:11", file: ""),
                            ], id: \.self, content: {
                                song in
                                SongCell(album: self.currentAlbum ?? self.data.albums.first!, song: song)
                        })
                    }
                }
            }.navigationBarTitle("Linkin Park")
        }
    }
}
