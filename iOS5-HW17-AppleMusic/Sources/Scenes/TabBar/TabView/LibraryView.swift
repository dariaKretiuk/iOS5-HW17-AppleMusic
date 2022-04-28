//
//  LibraryView.swift
//  iOS5-HW17-AppleMusic
//
//  Created by Дарья Кретюк on 09.04.2022.
//

import SwiftUI

struct LibraryView: View {
    
    // MARK: - Elements
    
    @State var expand = false
    @Namespace var animation
    
    // MARK: - Init
    
    init() {
        UITabBar.appearance().backgroundColor = .f5cac5
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView {
                ForEach(0..<3) { idx in
                    switch idx {
                    case 0: NavigationViewMedia()
                            .tabItem {
                                Image(systemName: "rectangle.stack.badge.play")
                                Text("Медиатека")
                            }
                    case 1: NavigationViewRadio()
                            .tabItem {
                                Image(systemName: "dot.radiowaves.left.and.right")
                                Text("Радио")
                            }
                    default: NavigationViewSearch()
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                                Text("Поиск")
                            }
                    }
                }
            }
            .accentColor(.red)
            
            MiniPlayer(animation: animation, expand: $expand)
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
