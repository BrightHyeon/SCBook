//
//  FontListView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/05/04.
//

import SwiftUI

struct FontListView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        ZStack {
            Theme.backgroundStyle(forScheme: colorScheme)
            
            VStack {
                
                NavigationLink {
                    FontSizeView()
                } label: {
                    PinkButton(text: "Font Size")
                }
                
                NavigationLink {
                    FontWeightView()
                } label: {
                    PinkButton(text: "Font Weight")
                }
                
                NavigationLink {
                    FontDesignView()
                } label: {
                    PinkButton(text: "Font Design")
                }
                
                NavigationLink {
                    MarkdownView()
                } label: {
                    PinkButton(text: "Markdown")
                }
                
                NavigationLink {
                    TextRotationView()
                } label: {
                    PinkButton(text: "TextRotation")
                }
            }
        }
        .navigationTitle("Text & Font")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FontListView_Previews: PreviewProvider {
    static var previews: some View {
        FontListView()
    }
}
