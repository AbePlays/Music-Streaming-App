//
//  PlayerView.swift
//  Music App
//
//  Created by Abhishek Rawat on 01/10/20.
//  Copyright © 2020 Abe10. All rights reserved.
//

import SwiftUI

struct PlayerView: View {
    var album : Album
    var song : Song
    
    @State var isPlaying : Bool = false
    
    var body: some View {
        ZStack {
            Image(album.image).resizable().edgesIgnoringSafeArea(.all)
            Blur(style: .dark).edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                AlbumArt(album: album, isWithText: false)
                Text(song.name)
                Spacer()
                ZStack {
                    Color.white.cornerRadius(20).shadow(radius: 10)
                    
                    HStack {
                        Button(action: self.playPause, label: {
                            Image(systemName: "arrow.left.circle").resizable()
                        }).frame(width: 70, height: 70, alignment: .center).foregroundColor(Color.black.opacity(0.2))
                        
                        Button(action: self.playPause, label: {
                            Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill").resizable()
                        }).frame(width: 70, height: 70, alignment: .center)
                        
                        Button(action: self.playPause, label: {
                            Image(systemName: "arrow.right.circle").resizable()
                        }).frame(width: 70, height: 70, alignment: .center).foregroundColor(Color.black.opacity(0.2))
                    }
                }
            }
        }
    }
    
    func playPause() {
        
    }
    
    func next() {
        
    }
    
    func previous() {
        
    }
}
