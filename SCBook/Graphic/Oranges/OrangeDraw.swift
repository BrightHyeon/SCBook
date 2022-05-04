//
//  Orange.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/28.
//

import SwiftUI

struct OrangeDraw: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.01039*width, y: 0.50779*height))
        path.addCurve(to: CGPoint(x: 0.43429*width, y: 0.11949*height), control1: CGPoint(x: 0.04044*width, y: 0.30317*height), control2: CGPoint(x: 0.21479*width, y: 0.14346*height))
        path.addLine(to: CGPoint(x: 0.43429*width, y: 0.11949*height))
        path.addLine(to: CGPoint(x: 0.43429*width, y: 0.02095*height))
        path.addCurve(to: CGPoint(x: 0.44106*width, y: 0.01251*height), control1: CGPoint(x: 0.43429*width, y: 0.01704*height), control2: CGPoint(x: 0.43705*width, y: 0.0136*height))
        path.addLine(to: CGPoint(x: 0.4439*width, y: 0.01174*height))
        path.addCurve(to: CGPoint(x: 0.61589*width, y: 0.0124*height), control1: CGPoint(x: 0.5001*width, y: -0.00355*height), control2: CGPoint(x: 0.55983*width, y: -0.00332*height))
        path.addLine(to: CGPoint(x: 0.61589*width, y: 0.0124*height))
        path.addCurve(to: CGPoint(x: 0.62235*width, y: 0.02113*height), control1: CGPoint(x: 0.61996*width, y: 0.01354*height), control2: CGPoint(x: 0.62265*width, y: 0.01717*height))
        path.addLine(to: CGPoint(x: 0.61429*width, y: 0.13017*height))
        path.addLine(to: CGPoint(x: 0.61429*width, y: 0.13017*height))
        path.addCurve(to: CGPoint(x: 0.99101*width, y: 0.47381*height), control1: CGPoint(x: 0.81069*width, y: 0.14771*height), control2: CGPoint(x: 0.96749*width, y: 0.29074*height))
        path.addLine(to: CGPoint(x: width, y: 0.54372*height))
        path.addLine(to: CGPoint(x: 0.99612*width, y: 0.57963*height))
        path.addCurve(to: CGPoint(x: 0.49863*width, y: height), control1: CGPoint(x: 0.97034*width, y: 0.81833*height), control2: CGPoint(x: 0.75534*width, y: height))
        path.addLine(to: CGPoint(x: 0.49863*width, y: height))
        path.addCurve(to: CGPoint(x: 0.00309*width, y: 0.59505*height), control1: CGPoint(x: 0.24827*width, y: height), control2: CGPoint(x: 0.0365*width, y: 0.82694*height))
        path.addLine(to: CGPoint(x: 0.00036*width, y: 0.5761*height))
        path.addLine(to: CGPoint(x: 0.01039*width, y: 0.50779*height))
        path.closeSubpath()
        return path
    }
}
