//
//  FontSizeView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/05/04.
//

import SwiftUI

struct FontSizeView: View {
    var body: some View {
        ScrollView {
            VStack {
                
                Text("**iOS Basic Font** : *SF Pro*")
                Text("Default Font Size : Body")
                
                Group {
                    HStack(alignment: .bottom) {
                        Text("Large Title")
                            .font(.largeTitle) //weight default - regular
                        Spacer()
                        Text("34 size")
                    }
                    .padding()
                    
                    HStack(alignment: .bottom) {
                        Text("Title1")
                            .font(.title) //weight default - regular
                        Spacer()
                        Text("28 size")
                    }
                    .padding()
                    
                    HStack(alignment: .bottom) {
                        Text("Title2")
                            .font(.title2) //weight default - regular
                        Spacer()
                        Text("22 size")
                    }
                    .padding()
                    
                    HStack(alignment: .bottom) {
                        Text("Title3")
                            .font(.title3) //weight default - regular
                        Spacer()
                        Text("20 size")
                    }
                    .padding()
                    
                    HStack(alignment: .bottom) {
                        Text("Headline")
                            .font(.headline) //weight default - semibold
                        Text("(default weight: .semibold)")
                            .font(.caption2)
                        Spacer()
                        Text("17 size")
                    }
                    .padding()
                }
                Group {
                    HStack(alignment: .bottom) {
                        Text("Body (default)")
                            .font(.body) //weight default - regular
                        Spacer()
                        Text("17 size")
                    }
                    .padding()
                    
                    HStack(alignment: .bottom) {
                        Text("Callout")
                            .font(.callout) //weight default - regular
                        Spacer()
                        Text("16 size")
                    }
                    .padding()
                    
                    HStack(alignment: .bottom) {
                        Text("Subhead")
                            .font(.subheadline) //weight default - regular
                        Spacer()
                        Text("15 size")
                    }
                    .padding()
                    
                    HStack(alignment: .bottom) {
                        Text("Footnote")
                            .font(.footnote) //weight default - regular
                        Spacer()
                        Text("13 size")
                    }
                    .padding()
                    
                    HStack(alignment: .bottom) {
                        Text("Caption1")
                            .font(.caption) //weight default - regular
                        Spacer()
                        Text("12 size")
                    }
                    .padding()
                }
                
                HStack(alignment: .bottom) {
                    Text("Caption2")
                        .font(.caption2) //weight default - regular
                    Spacer()
                    Text("11 size")
                }
                .padding()
            }
        }
        .navigationTitle("Font Size")
    }
}

struct FontSizeView_Previews: PreviewProvider {
    static var previews: some View {
        FontSizeView()
    }
}
