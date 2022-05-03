//
//  ButtonListView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/05/02.
//

import SwiftUI

struct ButtonListView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        ZStack {
            Theme.backgroundStyle(forScheme: colorScheme)
            
            VStack {
                
                NavigationLink {
                    BasicButtons()
                } label: {
                    PinkButton(text: "Basic")
                }
                
                NavigationLink {
                    MorphismButtons()
                } label: {
                    PinkButton(text: "Advanced")
                }
                
                NavigationLink {
                    MorphismButtons()
                } label: {
                    PinkButton(text: "Applications")
                }
            }
        }
        .navigationTitle("Button Style List")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ButtonListView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonListView()
    }
}
