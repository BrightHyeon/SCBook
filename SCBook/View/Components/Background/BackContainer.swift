//
//  BackContainer.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/29.
//

import SwiftUI

struct BackContainer: View {
    
    @State private var selection: Int = 0
    
    var body: some View {
        TabView {
            Text("").tag(0)
            Text("").tag(1)
        }
        .tabViewStyle(PageTabViewStyle())
        .background(
            Glassmorphism(selection: $selection)
            LoopingPlayer(selection: $selection)
        )
    }
}

struct BackContainer_Previews: PreviewProvider {
    static var previews: some View {
        BackContainer()
    }
}
