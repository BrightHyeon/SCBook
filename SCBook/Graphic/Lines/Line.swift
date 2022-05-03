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
        LineJeju()
    }
}

struct LineJeju: View {
    
    let w = UIScreen.main.bounds.width / 10 //대략 40
    let h = UIScreen.main.bounds.height / 10 //대략 85
    
    var body: some View {
        LinearGradient(
                    gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.027450980618596077, green: 0.054901961237192154, blue: 0.027450980618596077, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.4431372582912445, green: 0.7098039388656616, blue: 0.43529412150382996, alpha: 1)), location: 0.3645833432674408),
                .init(color: Color(#colorLiteral(red: 0.07450980693101883, green: 0.05882352963089943, blue: 0.9215686321258545, alpha: 1)), location: 0.703125),
                .init(color: Color(#colorLiteral(red: 0.10196078568696976, green: 0.3176470696926117, blue: 0.8745098114013672, alpha: 0)), location: 1)]),
                    startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                    endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999))
        .mask(
            LineJejuDraw().frame(width: w*15, height: h*4)
        )
    }
}
