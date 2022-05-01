//
//  BackTabView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/29.
//

import SwiftUI

struct BackTabView: View {
    
    @State private var selection: Int = 0
    
    var body: some View {
        TabView {
            TextView(selection: $selection).tag(0)
            LoopingPlayer(selection: $selection).tag(1)
        }
        .tabViewStyle(PageTabViewStyle())
        .background(
            Glassmorphism(selection: $selection)
            
        )
    }
}

struct BackTabView_Previews: PreviewProvider {
    static var previews: some View {
        BackTabView()
    }
}
