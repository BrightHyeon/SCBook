//
//  CurveDraw.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/27.
//

import SwiftUI

struct CurveDraw: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.99964*width, y: 0.25382*height))
        path.addLine(to: CGPoint(x: 0.73684*width, y: 0.17278*height))
        path.addLine(to: CGPoint(x: 0.51565*width, y: 0.12616*height))
        path.addLine(to: CGPoint(x: 0.45788*width, y: 0.10476*height))
        path.addCurve(to: CGPoint(x: 0.06324*width, y: 0.00112*height), control1: CGPoint(x: 0.32823*width, y: 0.05673*height), control2: CGPoint(x: 0.19635*width, y: 0.02209*height))
        path.addLine(to: CGPoint(x: 0.06324*width, y: 0.00112*height))
        path.addCurve(to: CGPoint(x: 0.00644*width, y: 0.11498*height), control1: CGPoint(x: 0.01978*width, y: -0.00573*height), control2: CGPoint(x: -0.01214*width, y: 0.05826*height))
        path.addLine(to: CGPoint(x: 0.05192*width, y: 0.25382*height))
        path.addLine(to: CGPoint(x: 0.05192*width, y: 0.25382*height))
        path.addCurve(to: CGPoint(x: 0.29538*width, y: 0.67505*height), control1: CGPoint(x: 0.10947*width, y: 0.41912*height), control2: CGPoint(x: 0.19277*width, y: 0.56325*height))
        path.addLine(to: CGPoint(x: 0.35597*width, y: 0.74108*height))
        path.addLine(to: CGPoint(x: 0.65469*width, y: 0.99949*height))
        return path
    }
}
