//
//  Orange.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/28.
//

import SwiftUI

struct Orange: View {
    
    @State private var isSpinning: Bool = false
    
    var body: some View {
        OrangeDraw()
            .fill(LinearGradient(
                gradient: Gradient(stops: [
            .init(color: Color(#colorLiteral(red: 0.9215686321258545, green: 0.5254902243614197, blue: 0.16078431904315948, alpha: 1)), location: 0),
            .init(color: Color(#colorLiteral(red: 0.3607843220233917, green: 0.4745098054409027, blue: 0.35686275362968445, alpha: 1)), location: 0.02604166604578495),
            .init(color: Color(#colorLiteral(red: 0.9215686321258545, green: 0.5254902243614197, blue: 0.16078431904315948, alpha: 1)), location: 0.1875),
            .init(color: Color(#colorLiteral(red: 0.9291666746139526, green: 0.596594512462616, blue: 0.2903645634651184, alpha: 1)), location: 0.6666666865348816),
            .init(color: Color(#colorLiteral(red: 0.9666666388511658, green: 0.5913152694702148, blue: 0.24569445848464966, alpha: 1)), location: 1)]),
                startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)))
            .frame(width: 70, height: 80)
            .blur(radius: 1)
            .rotationEffect(.degrees(isSpinning ? 360 : 0))
            .animation(.linear(duration: 3).repeatForever(autoreverses: false), value: isSpinning ? 360 : 0)
            .onAppear {
                self.isSpinning = true
            }
    }
}

struct Orange_Previews: PreviewProvider {
    static var previews: some View {
        Orange()
    }
}
