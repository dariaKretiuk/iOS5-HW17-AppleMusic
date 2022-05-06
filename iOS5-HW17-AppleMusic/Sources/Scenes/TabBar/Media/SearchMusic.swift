//
//  SearchMusic.swift
//  iOS5-HW17-AppleMusic
//
//  Created by Дарья Кретюк on 13.04.2022.
//

import SwiftUI

struct SearchMusic: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Text("Ищите свою музыку?")
                    .font(.title2)
                    .bold()
                
                Text("Здесь появится купленная Вами в iTunes Store музыка")
                    .multilineTextAlignment(.center)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(.secondary)
            }
            .padding(.top, 250)
        }
    }
}

struct SearchMusic_Previews: PreviewProvider {
    static var previews: some View {
        SearchMusic()
            .previewDevice("iPhone 13 Pro Max")
    }
}
