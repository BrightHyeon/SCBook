//
//  LayoutNavView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/05/01.
//

import SwiftUI

struct LayoutNavView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        ZStack {
            Theme.backgroundStyle(forScheme: colorScheme)
            
            VStack {
                Spacer()
                NavigationLink {
                    LazyVGridView()
                } label: {
                    PinkButton(text: "LazyVGrid Style")
                }
                
                Spacer().frame(height: 50)
                
                NavigationLink {
                    CustomLayoutView()
                } label: {
                    PinkButton(text: "Custom Layout")
                }
                Spacer()
            }
        }
        .navigationTitle("Layout Style List")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LayoutNavView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutNavView()
    }
}
