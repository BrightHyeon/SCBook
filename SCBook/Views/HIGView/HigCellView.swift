//
//  HigCellView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/28.
//

import SwiftUI

struct HigCellView: View {
    
    var hig: ListModel.HIG
    var namespace: Namespace.ID
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 12) {
                Text(hig.title)
                    .font(.title.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(hig.subtitle)
                    .font(.body.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                Text(hig.introduce)
                    .font(.footnote.weight(.semibold))
            }
            .padding(20)
            .background {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(.ultraThinMaterial)
                    .blur(radius: 20)
            }
        }
        .foregroundStyle(.primary)
        .background(
            Image(hig.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
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
        HigCellView(hig: ListViewModel().list[0].hig!, namespace: namespace)
    }
}
