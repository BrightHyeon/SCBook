//
//  FontWeightView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/05/04.
//

import SwiftUI

struct FontWeightView: View {
    var body: some View {
        ScrollView {
            VStack {
                
                Text("**iOS Basic Font** : *SF Pro*")
                Text("Default Font Weight : Regular")
                
                Group {
                    HStack(alignment: .bottom) {
                        Text("ABCDEFG")
                            .font(.largeTitle, weight: .black)
                        Spacer()
                        Text("Black")
                    }
                    .padding()
                    
                    HStack(alignment: .bottom) {
                        Text("ABCDEFG")
                            .font(.largeTitle, weight: .heavy)
                        Spacer()
                        Text("Heavy")
                    }
                    .padding()
                    
                    HStack(alignment: .bottom) {
                        Text("ABCDEFG")
                            .font(.largeTitle, weight: .bold)
                        Spacer()
                        Text("Bold")
                    }
                    .padding()
                    
                    HStack(alignment: .bottom) {
                        Text("ABCDEFG")
                            .font(.largeTitle, weight: .semibold)
                        Spacer()
                        Text("Semibold")
                    }
                    .padding()
                    
                    HStack(alignment: .bottom) {
                        Text("ABCDEFG")
                            .font(.largeTitle, weight: .medium)
                        Spacer()
                        Text("Medium")
                    }
                    .padding()
                }
                Group {
                    
                    HStack(alignment: .bottom) {
                        Text("ABCDEFG")
                            .font(.largeTitle, weight: .regular)
                        Spacer()
                        Text("Regular")
                    }
                    .padding()
                    
                    HStack(alignment: .bottom) {
                        Text("ABCDEFG")
                            .font(.largeTitle, weight: .light)
                        Spacer()
                        Text("Light")
                    }
                    .padding()
                    
                    HStack(alignment: .bottom) {
                        Text("ABCDEFG")
                            .font(.largeTitle, weight: .thin)
                        Spacer()
                        Text("Thin")
                    }
                    .padding()
                    
                    HStack(alignment: .bottom) {
                        Text("ABCDEFG")
                            .font(.largeTitle, weight: .ultraLight)
                        Spacer()
                        Text("UltraLight")
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Font Weight")
    }
}

struct FontWeightView_Previews: PreviewProvider {
    static var previews: some View {
        FontWeightView()
    }
}
