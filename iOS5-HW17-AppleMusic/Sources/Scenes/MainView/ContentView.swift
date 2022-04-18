//
//  ContentView.swift
//  iOS5-HW17-AppleMusic
//
//  Created by Дарья Кретюк on 13.04.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LibraryView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
