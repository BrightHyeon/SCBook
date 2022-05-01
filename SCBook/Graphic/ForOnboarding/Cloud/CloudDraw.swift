//
//  CloudDraw.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/28.
//

import SwiftUI

struct CloudDraw: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.95693*width, y: 0.5888*height))
        path.addCurve(to: CGPoint(x: 0.66065*width, y: 0.82863*height), control1: CGPoint(x: 1.09517*width, y: 0.90781*height), control2: CGPoint(x: 0.87311*width, y: 1.17081*height))
        path.addCurve(to: CGPoint(x: 0.12951*width, y: 0.64424*height), control1: CGPoint(x: 0.50291*width, y: 1.15158*height), control2: CGPoint(x: -0.31141*width, y: 0.97681*height))
        path.addCurve(to: CGPoint(x: 0.4901*width, y: 0.28846*height), control1: CGPoint(x: 0.17142*width, y: 0.05713*height), control2: CGPoint(x: 0.33556*width, y: 0.04412*height))
        path.addCurve(to: CGPoint(x: 0.95693*width, y: 0.5888*height), control1: CGPoint(x: 0.64464*width, y: -0.37105*height), control2: CGPoint(x: 1.09517*width, y: 0.26357*height))
        path.closeSubpath()
        return path
    }
}
