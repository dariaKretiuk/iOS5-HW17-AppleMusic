//
//  MiniPlayer.swift
//  iOS5-HW17-AppleMusic
//
//  Created by Дарья Кретюк on 09.04.2022.
//

import SwiftUI

struct MiniPlayer: View {
    
    // MARK: - Elements
    
    var animation: Namespace.ID
    var height = UIScreen.main.bounds.height / 3
    var safeArea = UIApplication.shared.windows.first?.safeAreaInsets
    
    @State private var model = AppleMusicModel().getMiniPlayer()
    @Binding var expand: Bool
    @State var volumeSounds: CGFloat = 0
    @State var volumeDuration: CGFloat = 0
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            if expand {
                self.player(data: model)
            } else {
                self.miniPlayer(data: model)
            }
        }
        .background(
            Color(UIColor.f5cac5)
                .onTapGesture {
                    withAnimation(.spring()) {
                        expand.toggle()
                    }
                }
        )
        .padding(.leading, 10)
        .frame(maxHeight: expand ? .infinity : 80)
        .ignoresSafeArea()
        .offset(y: expand ? 0 : -50)
    }

    private func miniPlayer(data: MiniPlayerData) -> some View {
        return HStack {
                Image("SOAD")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 55, height: 55)
                    .cornerRadius(15)

                Text("Sugar")
                    .font(.title2)
                    .matchedGeometryEffect(id: "Label", in: animation)

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
    }
    
    private func player(data: MiniPlayerData) -> some View {
        return VStack {
            Capsule()
                .fill(Color.gray)
                .frame(width: 60, height: 4)
                .opacity(1)
                .padding(.top, safeArea?.top)
                .padding(.vertical, 30)
            
            Image(data.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: height, height: height)
                    .cornerRadius(15)
            .padding()
            
            VStack {
                HStack {
                    VStack {
                        Text(data.name)
                            .font(.title2)
                            .foregroundColor(.primary)
                            .fontWeight(.bold)
                            .padding(.leading, 7)
                            
                        Text(data.nameSing)
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {}) {
                        
                        Image(systemName: "ellipsis.circle")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                }
                .padding()
                .padding(.top, 100)
                
                Spacer(minLength: 0)
                
                VStack {
                    Slider(value: $volumeDuration, in: 0...CGFloat(data.duration))
                        .accentColor(.black)
                    
                    HStack {
                        
                        Text("\(stringDuration(duration: Int(volumeDuration)))")
                            .font(.system(size: 10, weight: .regular, design: .default))
                            .foregroundColor(.gray)
                        
                        Spacer(minLength: 0)
                            
                        Text("-\(stringDuration(duration: Int(CGFloat(data.duration) - volumeDuration)))")
                            .font(.system(size: 10, weight: .regular, design: .default))
                            .foregroundColor(.gray)
                    }
                    .padding(.top, -10)
                }
                .padding()
                
                Spacer(minLength: 0)
                
                HStack(spacing: 40) {
                    Button(action: {}) {
                        Image(systemName: "backward.fill")
                            .resizable()
                            .foregroundColor(.primary)
                            .frame(width: 50, height: 30)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "play.fill")
                            .resizable()
                            .foregroundColor(.primary)
                            .frame(width: 40, height: 40)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                            .resizable()
                            .foregroundColor(.primary)
                            .frame(width: 50, height: 30)
                    }
                }
                .padding()
                
                Spacer(minLength: 0)
                
                HStack(spacing: 15) {
                    Image(systemName: "speaker.fill")
                    
                    Slider(value: $volumeSounds)
                        .accentColor(.black)
                    
                    Image(systemName: "speaker.wave.2.fill")
                }
                .padding()
                
                Spacer(minLength: 0)
                
                HStack(spacing: 30) {
                    Button(action: {}) {
                        Image(systemName: "quote.bubble")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "airplayaudio")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "list.bullet")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.bottom, safeArea?.bottom == 0 ? 15 : safeArea?.bottom)
            }
            .frame(width: nil, height: nil)
            .opacity(1)
        }
    }
    
    private func stringDuration(duration: Int) -> String {
        return "\(duration / 60):\((duration % 60 < 10) ? "0\(duration % 60)" : "\(duration % 60)")"
    }
}
