//
//  Line2.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/27.
//

import SwiftUI

struct Line2: View {
    let w = UIScreen.main.bounds.width / 10 //대략 40
    let h = UIScreen.main.bounds.height / 10 //대략 85
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.949999988079071, green: 0.6611999869346619, blue: 0.5699999928474426, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 0.6800000071525574)), location: 1)]),
            startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
            endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999))
        .mask(
            LineDraw().frame(width: w*15, height: h*4)
        )
    }
}

struct Line2_Previews: PreviewProvider {
    static var previews: some View {
        Line2()
    }
}
