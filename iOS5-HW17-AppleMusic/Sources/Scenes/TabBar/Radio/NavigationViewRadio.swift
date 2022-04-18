//
//  NavigationViewRadio.swift
//  iOS5-HW17-AppleMusic
//
//  Created by Дарья Кретюк on 18.04.2022.
//

import SwiftUI

struct NavigationViewRadio: View {
    
    // MARK: - Elements
    @State private var model = AppleMusicModel().getStationRadio()
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(Array(model.enumerated()), id: \.offset) { offset, item in
                    switch offset {
                    case 0: FirstSectionCollection(model: item)
                    default: VStack {
                        Rectangle()
                            .fill(Color(UIColor.f5cac5.cgColor))
                            .frame(width: 450, height: 2, alignment: .center)
                            .padding(.top, 10)
                        SecondSectionStation(model: item)
                    }
                    }
                }
            }
            .navigationTitle("Радио")
        }
    }
    
    // MARK: - Private func
    
}

struct FirstSectionCollection: View {
    var model: [Radio]

    let rows = [
        GridItem(.adaptive(minimum: 300))
    ]
    
    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows) {
                    ForEach(model, id: \.self) { data in
                        VStack {
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
                            
                            Text(data.nameStation ?? "")
                                .font(.system(size: 24, weight: .regular, design: .default))
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Image(data.icon)
                                .resizable()
                                .frame(width: 350, height: 200)
                                .cornerRadius(5)
                                .padding(.leading, -10)
                        }
                    }
                }
            }
        }
        .padding(.leading, 30)
    }
}

struct SecondSectionStation: View {
    var model: [Radio]
    
    let columns = [
        GridItem(.adaptive(minimum: 500))
    ]
    
    var body: some View {
        Section(
            header: HStack {
                Text("Станции")
                    .bold()
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
            }
        ) {
            LazyVGrid(columns: columns) {
                ForEach(model, id: \.self) { data in
                    HStack {
                        Image(data.icon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            .cornerRadius(5)
                        
                        VStack {
                            Text(data.name)
                                .font(.system(size: 20, weight: .regular, design: .default))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text(data.additionalInfo)
                                .font(.system(size: 15, weight: .regular, design: .default))
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .frame(width: 410, height: 150, alignment: .leading)
                }
            }
        }
        .padding(.leading, 20)
    }
}

struct NavigationViewRadio_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewRadio()
            .previewDevice("iPhone 13 Pro Max")
    }
}

