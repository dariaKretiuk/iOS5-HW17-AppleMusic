//
//  NavigationViewSearch.swift
//  iOS5-HW17-AppleMusic
//
//  Created by Дарья Кретюк on 16.04.2022.
//

import SwiftUI

struct NavigationViewSearch: View {
    
    // MARK: - Elements
    
    @State private var text = ""
    @State private var model = AppleMusicModel().getSearch()
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    SearchBar(text: $text)
                        .padding(.top, 0)
                    Rectangle()
                        .fill(Color(UIColor.f5cac5.cgColor))
                        .frame(width: 390, height: 2, alignment: .center)
                        .padding(.top, 5)
                    SectionMain(model: model)
                }
            }
            .navigationTitle("Поиск")
        }
    }
}

struct SectionMain: View {
    let columns = [
        GridItem(.fixed(190)),
        GridItem(.fixed(190))
    ]
    @State var model: [Search]
    
    var body: some View {
        Section(
            header:
                Text("Поиск по категориям")
                .bold()
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
        ) {
            ZStack {
                LazyVGrid(columns: columns) {
                    ForEach(0..<model.count) { idx in
                        HStack {
                            NavigationLink(destination: CategoryCellSearch(name: self.$model[idx].name)) {
                                    Image(self.model[idx].icon)
                                        .resizable()
                                        .frame(width: 190, height: 120)
                                        .cornerRadius(10)
                                }
                        }
                    }
                }
            }
            .padding(.bottom, 100)
        }
    }
}

struct NavigationViewSearch_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewSearch()
            .previewDevice("iPhone 13 Pro Max")
    }
}
