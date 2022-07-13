//
//  Home.swift
//  Parallax
//
//  Created by Эрхаан Говоров on 13.07.2022.
//

import SwiftUI

struct Home: View {
    @StateObject var motionManager: MotionManager = .init()
    var body: some View {
        ParallaxCards()
    }
        @ViewBuilder
        func ParallaxCards() -> some View {
            TabView(selection: $motionManager.currentSlide){
                ForEach(sample_places){place in
                    GeometryReader{proxy in
                        let size = proxy.size
                        
                        ZStack {
                            Image("leviBG")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .offset(x: motionManager.currentSlide.id == place.id ? -motionManager.xValue * 75 : 0)
                                .frame(width: size.width, height: size.height)
                                .clipped()
                                // .ignoresSafeArea()
                                
                            
                            Image("eren")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .offset(x: motionManager.currentSlide.id == place.id ? motionManager.xValue * 7 : 0)
                                .frame(width: size.width, height: size.height)
                                .clipped()

                            
                        }
                        .frame(width: size.width, height: size.height, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                    }
                    .padding(.vertical, 30)
                    .padding(.horizontal, 40)
                    .tag(place)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onAppear(perform: motionManager.detectMotion)
            .onDisappear(perform: motionManager.stopMotionUpdates)
        }
        
       
    }


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
