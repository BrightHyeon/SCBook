//
//  GlassCell.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/29.
//

import SwiftUI

struct GlassCell: View {
    var namespace: Namespace.ID
    
    let w = UIScreen.main.bounds.width / 10 //대략 40
    let h = UIScreen.main.bounds.height / 10 //대략 85
    
    var body: some View {
        VStack {
            Spacer()
            Text("Glassmorphism")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.primary)
                .matchedGeometryEffect(id: "title", in: namespace)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .fill(.ultraThinMaterial)
                        .blur(radius: 20)
                )
                .matchedGeometryEffect(id: "stroke", in: namespace)
        }
        .background(
            background
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .frame(height: 200)
        .padding(20)
    }
    
    //MARK: 이렇게 사용하면, 실제 보이지않는 뒷배경이 존재해서 터지반경이 어쩔 수 없이 넓어지는 듯. 이런저런 방법으로 해결해보려했으나 잘 안됨. hierarchy로 봐도 이상하게 뒷배경이 더 상단에 존재?함...
    //background의 요소들의 frame을 좀 없애줌.
    var background: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.cyan.opacity(0.7), Color.purple.opacity(0.7)]), startPoint: .top, endPoint: .bottom)

            Circle()
                .foregroundColor(.blue.opacity(0.6))
                .blur(radius: 10)
                .frame(width: 400, height: 200)
                .offset(x: -150, y: -150)
//                .blendMode(.overlay) //뒷색상과 잘어울려짐.

            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .frame(width: 400, height: 200)
                .foregroundStyle(LinearGradient(colors: [Color.green.opacity(0.6), Color.mint.opacity(0.6)], startPoint: .top, endPoint: .bottom))
                .offset(x: 300)
                .blur(radius: 80)
                .rotationEffect(.degrees(30))
//                .blendMode(.overlay)

            Circle()
                .foregroundColor(.pink.opacity(0.6))
                .blur(radius: 20)
                .frame(width: 400)
                .offset(x: 150, y: -200)
        }
    }
}

struct GlassCell_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        GlassCell(namespace: namespace)
    }
}
