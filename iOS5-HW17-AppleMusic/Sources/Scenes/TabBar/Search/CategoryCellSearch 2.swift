//
//  CategoryCellSearch.swift
//  iOS5-HW17-AppleMusic
//
//  Created by Дарья Кретюк on 19.04.2022.
//

import SwiftUI

struct CategoryCellSearch: View {
    
    // MARK: - Elements
    
    @Binding var name: String
    @State private var model = AppleMusicModel().getSearchCell()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(Array(model.enumerated()), id: \.offset) { offset, item in
                switch offset {
                case 0: FirstSectionSearchCollection(model: item)
                case 1: VStack {
                    Rectangle()
                    .fill(Color(UIColor.f5cac5.cgColor))
                        .frame(width: 450, height: 2, alignment: .center)
                        .padding(.top, 10)
                    SecondSectionSearchCollection(model: item)
                }
                default: VStack {
                        Rectangle()
                        .fill(Color(UIColor.f5cac5.cgColor))
                            .frame(width: 450, height: 2, alignment: .center)
                            .padding(.top, 10)
                        ThirdSectionSearchCollection(model: item)
                    }
                    .padding(.bottom, 100)
                }
            }
        }
        .navigationBarTitle(name)
    }
}

struct FirstSectionSearchCollection: View {
    var model: [SearchCell]

    let rows = [
        GridItem(.adaptive(minimum: 300))
    ]
    
    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows) {
                    ForEach(Array(model.enumerated()), id: \.offset) { offset, data in
                        switch offset {
                        case 0:
                            self.horizontalScroll(data: data)
                                .padding(.leading, 30)
                        case (model.count - 1):
                            self.horizontalScroll(data: data)
                                .padding(.trailing, 30)
                        default:
                            self.horizontalScroll(data: data)
                        }
                    }
                }
            }
        }
    }
    
    private func horizontalScroll(data: SearchCell) -> some View {
        return VStack {
            Rectangle()
                .fill(Color(UIColor.f5cac5.cgColor))
                .frame(width: 360, height: 2, alignment: .center)
                .padding(.bottom, 10)
            
            Text(data.additionalInfo)
                .font(.system(size: 15, weight: .regular, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.gray)
            
            Text(data.name)
                .font(.system(size: 24, weight: .regular, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(data.nameAlbum ?? "")
                .font(.system(size: 24, weight: .regular, design: .default))
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Rectangle()
                .frame(width: 350, height: 200)
                .cornerRadius(5)
        }
    }
    
}

struct SecondSectionSearchCollection: View {
    var model: [SearchCell]
    
    let rows = [
        GridItem(.adaptive(minimum: 200))
    ]
    
    var body: some View {
        Section(
            header: Text("Избранные плейлисты")
                .bold()
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 30)
        ) {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows) {
                    ForEach(Array(model.enumerated()), id: \.offset) { offset, data in
                        switch offset {
                        case 0:
                            self.horizontalScroll(data: data)
                                .padding(.leading, 30)
                        case (model.count - 1):
                            self.horizontalScroll(data: data)
                                .padding(.trailing, 30)
                        default:
                            self.horizontalScroll(data: data)
                        }
                    }
                }
            }
        }
    }
    
    private func horizontalScroll(data: SearchCell) -> some View {
        return VStack {
            Rectangle()
                .frame(width: 200, height: 200)
                .cornerRadius(5)
            
            Text(data.name)
                .font(.system(size: 18, weight: .regular, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(width: 200)
                .lineLimit(1)
            
            Text(data.additionalInfo)
                .font(.system(size: 15, weight: .regular, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.gray)
                .lineLimit(1)
        }
    }
    
}

struct ThirdSectionSearchCollection: View {
    var model: [SearchCell]

    let rows = [
        GridItem(.adaptive(minimum: 200)),
        GridItem(.adaptive(minimum: 200)),
        GridItem(.adaptive(minimum: 200)),
        GridItem(.adaptive(minimum: 200))
    ]
    
    var body: some View {
        Section(
            header: Text("Лучшие новые треки")
                .bold()
                .font(.title2)
                .padding(.leading, 30)
                .frame(maxWidth: .infinity, alignment: .leading)
        ) {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows) {
                    ForEach(Array(model.enumerated()), id: \.offset) { offset, data in
                        switch offset {
                        case 0...3:
                            self.horizontalScroll(data: data)
                                .padding(.leading, 30)
                                .frame(width: 380, height: 260, alignment: .leading)
                        case (model.count - 3)...(model.count - 1):
                            self.horizontalScroll(data: data)
                                .padding(.trailing, 30)
                                .frame(width: 380, height: 260, alignment: .leading)
                        default:
                            self.horizontalScroll(data: data)
                                .frame(width: 380, height: 260, alignment: .leading)
                        }
                    }
                }
            }
        }
    }
    
    private func horizontalScroll(data: SearchCell) -> some View {
        return HStack {
            Rectangle()
                .frame(width: 60, height: 60, alignment: .leading)
                .cornerRadius(5)
            
            VStack {
                    Text(data.name)
                        .font(.system(size: 18, weight: .regular, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    Text(data.additionalInfo)
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.gray)
            }
            .padding(.top, -15)
            
            Image(systemName: "list.bullet.circle")
        }
    }
}

struct CategoryCellSearch_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCellSearch(name: .constant("Hello"))
            .previewDevice("iPhone 13 Pro Max")
    }
}
