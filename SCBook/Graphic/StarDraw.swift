//
//  StarDraw.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/27.
//

import SwiftUI

struct StarDraw: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.5*width, y: 0))
        path.addLine(to: CGPoint(x: 0.61797*width, y: 0.38165*height))
        path.addLine(to: CGPoint(x: 0.99974*width, y: 0.38165*height))
        path.addLine(to: CGPoint(x: 0.69088*width, y: 0.61753*height))
        path.addLine(to: CGPoint(x: 0.80885*width, y: 0.99919*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.76331*height))
        path.addLine(to: CGPoint(x: 0.19115*width, y: 0.99919*height))
        path.addLine(to: CGPoint(x: 0.30912*width, y: 0.61753*height))
        path.addLine(to: CGPoint(x: 0.00026*width, y: 0.38165*height))
        path.addLine(to: CGPoint(x: 0.38203*width, y: 0.38165*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0))
        path.closeSubpath()
        return path
    }
}
