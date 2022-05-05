//
//  MountainDraw.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/05/05.
//

import SwiftUI

struct MountainDraw: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.27936*width, y: 0.24297*height))
        path.addCurve(to: CGPoint(x: 0.34434*width, y: 0.09735*height), control1: CGPoint(x: 0.29546*width, y: 0.18639*height), control2: CGPoint(x: 0.31759*width, y: 0.1368*height))
        path.addLine(to: CGPoint(x: 0.34434*width, y: 0.09735*height))
        path.addCurve(to: CGPoint(x: 0.637*width, y: 0.08817*height), control1: CGPoint(x: 0.42998*width, y: -0.0289*height), control2: CGPoint(x: 0.54922*width, y: -0.03264*height))
        path.addLine(to: CGPoint(x: 0.64263*width, y: 0.09592*height))
        path.addCurve(to: CGPoint(x: 0.71425*width, y: 0.24794*height), control1: CGPoint(x: 0.67196*width, y: 0.13628*height), control2: CGPoint(x: 0.69638*width, y: 0.18812*height))
        path.addLine(to: CGPoint(x: 0.75421*width, y: 0.38169*height))
        path.addLine(to: CGPoint(x: 0.78922*width, y: 0.52116*height))
        path.addLine(to: CGPoint(x: 0.8372*width, y: 0.70294*height))
        path.addLine(to: CGPoint(x: 0.8372*width, y: 0.70294*height))
        path.addCurve(to: CGPoint(x: 0.96652*width, y: 0.95636*height), control1: CGPoint(x: 0.87096*width, y: 0.80296*height), control2: CGPoint(x: 0.91493*width, y: 0.88913*height))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0.00023*width, y: height))
        path.addLine(to: CGPoint(x: 0.0301*width, y: 0.96*height))
        path.addCurve(to: CGPoint(x: 0.16303*width, y: 0.70294*height), control1: CGPoint(x: 0.08221*width, y: 0.89023*height), control2: CGPoint(x: 0.12725*width, y: 0.80315*height))
        path.addLine(to: CGPoint(x: 0.16303*width, y: 0.70294*height))
        path.addLine(to: CGPoint(x: 0.21101*width, y: 0.52116*height))
        path.addLine(to: CGPoint(x: 0.23988*width, y: 0.38169*height))
        path.addLine(to: CGPoint(x: 0.27936*width, y: 0.24297*height))
        path.closeSubpath()
        return path
    }
}
