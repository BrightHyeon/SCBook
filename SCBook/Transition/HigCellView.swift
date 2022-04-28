//
//  HigCellView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/28.
//

import SwiftUI

struct HigCellView: View {
    
    var namespace: Namespace.ID
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 12) {
                Text("Buttons")
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Controls")
                    .font(.body.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                Text("Let's see Human Interface Guidelines!")
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "text", in: namespace)
            }
            .padding(20)
            .background {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(.ultraThinMaterial)
                    .blur(radius: 30)
            }
        }
        .foregroundStyle(.primary)
        .background(
            Image("Button")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        )
        .frame(height: 300)
        .padding(20)
    }
}

struct HigCellView_Previews: PreviewProvider {
    
    @Namespace static var namespace
    
    static var previews: some View {
        HigCellView(namespace: namespace)
    }
}
