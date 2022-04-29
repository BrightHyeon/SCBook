//
//  BackgroundList.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/29.
//

import SwiftUI

struct BackgroundList: View {
    
    @ObservedObject var cd: ColorDict
    @Namespace var namespace
    @State private var showGlass = false
    
    var body: some View {
        ZStack {
            cd.background
                .ignoresSafeArea()
            
            ScrollView {
                
                Text("Backgrounds".uppercased())
                    .font(.body.weight(.semibold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                
                if !showGlass {
                    //glassCell만들기
                    GlassCell(namespace: namespace)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                showGlass.toggle()
                            }
                        }
                }
            }
            
            //ZStack으로 위에 덮듯이 띄우기.
            if showGlass {
                //glassView띄우기
                Glassmorphism(namespace: namespace, showGlass: $showGlass)
            }
        }
    }
}

struct BackgroundList_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        BackgroundList(cd: ColorDict())
    }
}
