//
//  Line.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/27.
//

import SwiftUI

struct Line: View {
    
    let w = UIScreen.main.bounds.width / 10 //대략 40
    let h = UIScreen.main.bounds.height / 10 //대략 85
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.1671474575996399, green: 0.048524320125579834, blue: 0.8958333134651184, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.8541666865348816, green: 0.09965276718139648, blue: 0.7787150144577026, alpha: 1)), location: 1)]),
            startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
            endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999))
        .mask(
            LineDraw().frame(width: w*15, height: h*4)
        )
    }
}

struct Line_Previews: PreviewProvider {
    static var previews: some View {
        Line()
    }
}
