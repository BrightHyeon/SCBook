//
//  FontDesignView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/05/04.
//

import SwiftUI

struct FontDesignView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("**iOS Basic Font** : *SF Pro*")
                Text("Default Font Design : Default")
                
                HStack(alignment: .bottom) {
                    Text("ABCDE123")
                        .font(.system(.largeTitle, design: .default))
                        .fontWeight(.black)
                    Spacer()
                    Text("Default")
                }
                .padding()
                
                HStack(alignment: .bottom) {
                    Text("ABCDE123")
                        .font(.system(.largeTitle, design: .monospaced))
                        .fontWeight(.black)
                    Spacer()
                    Text("Monospaced")
                }
                .padding()
                
                HStack(alignment: .bottom) {
                    Text("ABCDE123")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
                    Spacer()
                    Text("Rounded")
                }
                .padding()
                
                HStack(alignment: .bottom) {
                    Text("ABCDE123")
                        .font(.system(.largeTitle, design: .serif))
                        .fontWeight(.black)
                    Spacer()
                    Text("Serif")
                }
                .padding()
                
                Text("<LargeTitle & Black 기준>")
                    .font(.callout, weight: .semibold)
            }
        }
        .navigationTitle("Font Design")
    }
}

struct FontDesignView_Previews: PreviewProvider {
    static var previews: some View {
        FontDesignView()
    }
}
