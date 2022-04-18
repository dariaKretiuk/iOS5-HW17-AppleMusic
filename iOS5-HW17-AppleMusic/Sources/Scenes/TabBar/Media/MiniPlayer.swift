//
//  MiniPlayer.swift
//  iOS5-HW17-AppleMusic
//
//  Created by Дарья Кретюк on 09.04.2022.
//

import SwiftUI

struct MiniPlayer: View {
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Image("SOAD")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 55, height: 55)
                    .cornerRadius(15)
                
                Text("SOAD")
                    .font(.title2)
                
                Spacer(minLength: 0)
                
                Button(action: {}, label: {
                    Image(systemName: "play.fill")
                        .font(.title2)
                        .foregroundColor(.primary)
                })
                
                Button(action: {}, label: {
                    Image(systemName: "forward.fill")
                        .font(.title2)
                        .foregroundColor(.primary)
                })
            }
            .padding()
            .background(Color(UIColor.f5cac5))
        }
        .padding(.bottom, 100)
        .frame(height: 80)
    }
}

struct MiniPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MiniPlayer()
            .previewDevice("iPhone 13 Pro Max")
    }
}
