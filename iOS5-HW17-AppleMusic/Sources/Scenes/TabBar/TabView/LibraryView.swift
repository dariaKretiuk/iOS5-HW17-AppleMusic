//
//  LibraryView.swift
//  iOS5-HW17-AppleMusic
//
//  Created by Дарья Кретюк on 09.04.2022.
//

import SwiftUI

struct LibraryView: View {
    
    // MARK: - Init
    
    init() {
        UITabBar.appearance().backgroundColor = .f5cac5
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView {
                NavigationViewMedia()
                    .tabItem {
                        Image(systemName: "rectangle.stack.badge.play")
                        Text("Медиатека")
                    }
                
                NavigationViewRadio()
                    .tabItem {
                        Image(systemName: "dot.radiowaves.left.and.right")
                        Text("Радио")
                    }
                
                Text("Поиск")
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Поиск")
                    }
            }
            .accentColor(.red)
            
            MiniPlayer()
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
