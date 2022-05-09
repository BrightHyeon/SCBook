//
//  BackgroundList.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/29.
//

import SwiftUI

struct BackgroundList: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
//    @ObservedObject var cd: ColorDict
    @Namespace var namespace
    @State private var showGlass = false
    
    var body: some View {
        ZStack {
            
            Theme.backgroundStyle(forScheme: colorScheme)
            
            ScrollView {
                
//                Text("Backgrounds".uppercased())
//                    .font(.body.weight(.semibold))
//                    .foregroundColor(.secondary)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.horizontal, 20)
                
                if !showGlass {
                    //glassCell만들기
                    GlassCell(namespace: namespace)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.5)) {
                                showGlass.toggle()
                            }
                        }
                }
                Spacer()
                
                NavigationLink {
                    LoopingPlayer()
                        .ignoresSafeArea()
                } label: {
                    VStack {
                        Spacer()
                        Text("LoopingPlayer")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                            .minimumScaleFactor(0.7)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(20)
                            .background(
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                                    .fill(.ultraThinMaterial)
                                    .blur(radius: 20)
                            )
                    }
                    .background(
                        LoopingPlayer()
                    )
                    .clipShape(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                    )
                    .frame(height: 200)
                    .padding(20)
                }
            }
            
            //ZStack으로 위에 덮듯이 띄우기.
            if showGlass {
                //glassView띄우기
                Glassmorphism(namespace: namespace, showGlass: $showGlass)
            }
        }
        .navigationTitle("Background")
    }
}

struct BackgroundList_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        BackgroundList()
    }
}
