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

struct ContentView: View {
    var body: some View {
        Text("Hello World")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
