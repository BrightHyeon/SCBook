//
//  GlassMovingVersion.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/27.
//

import SwiftUI

import SwiftUI

struct GlassMovingVersion: View {
    var body: some View {
        ZStack {
            background
                .ignoresSafeArea()
            
            VStack {
                Text("Glassmorphism")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(LinearGradient(colors: [Color.purple.opacity(0.9), Color.pink.opacity(0.9)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .padding()
            }
            .padding()
            .background(LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color.white.opacity(0.4), location: 0),
                    .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)), location: 1)]),
                startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)), in: RoundedRectangle(cornerRadius: 12, style: .continuous)
            )
        }
    }
    
    var background: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.cyan.opacity(0.7), Color.purple.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
            
            Circle()
                .foregroundColor(.blue.opacity(0.6))
                .blur(radius: 10)
                .frame(width: 300)
                .offset(x: -150, y: -150)
//                .blendMode(.overlay) //뒷색상과 잘어울려짐.
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .frame(width: 500, height: 500)
                .foregroundStyle(LinearGradient(colors: [Color.green.opacity(0.6), Color.mint.opacity(0.6)], startPoint: .top, endPoint: .bottom))
                .offset(x: 300)
                .blur(radius: 80)
                .rotationEffect(.degrees(30))
//                .blendMode(.overlay)
            
            Circle()
                .foregroundColor(.pink.opacity(0.6))
                .blur(radius: 20)
                .frame(width: 450)
                .offset(x: 150, y: -200)
        }
    }
}

struct GlassMovingVersion_Previews: PreviewProvider {
    static var previews: some View {
        GlassMovingVersion()
    }
}
