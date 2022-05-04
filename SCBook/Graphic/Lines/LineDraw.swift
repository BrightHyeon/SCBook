//
//  LineDraw.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/27.
//

import SwiftUI

struct LineDraw: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.34585*width, y: 0.16967*height))
        path.addLine(to: CGPoint(x: 0.49245*width, y: 0.00376*height))
        path.addCurve(to: CGPoint(x: 0.5072*width, y: 0.00462*height), control1: CGPoint(x: 0.49662*width, y: -0.00096*height), control2: CGPoint(x: 0.50349*width, y: -0.00056*height))
        path.addLine(to: CGPoint(x: 0.60794*width, y: 0.14492*height))
        path.addCurve(to: CGPoint(x: 0.64761*width, y: 0.19202*height), control1: CGPoint(x: 0.62004*width, y: 0.16178*height), control2: CGPoint(x: 0.63331*width, y: 0.17753*height))
        path.addLine(to: CGPoint(x: 0.64761*width, y: 0.19202*height))
        path.addCurve(to: CGPoint(x: 0.82856*width, y: 0.29106*height), control1: CGPoint(x: 0.69851*width, y: 0.2436*height), control2: CGPoint(x: 0.76122*width, y: 0.27793*height))
        path.addLine(to: CGPoint(x: 0.92059*width, y: 0.30901*height))
        path.addCurve(to: CGPoint(x: 0.92481*width, y: 0.31183*height), control1: CGPoint(x: 0.92225*width, y: 0.30933*height), control2: CGPoint(x: 0.92375*width, y: 0.31034*height))
        path.addLine(to: CGPoint(x: 0.92481*width, y: 0.31183*height))
        path.addCurve(to: CGPoint(x: 0.99982*width, y: 0.55468*height), control1: CGPoint(x: 0.97337*width, y: 0.38084*height), control2: CGPoint(x: 0.99982*width, y: 0.46646*height))
        path.addLine(to: CGPoint(x: 0.99982*width, y: 0.68092*height))
        path.addLine(to: CGPoint(x: 0.74142*width, y: 0.85172*height))
        path.addLine(to: CGPoint(x: 0.74142*width, y: 0.85172*height))
        path.addCurve(to: CGPoint(x: 0.21249*width, y: 0.90822*height), control1: CGPoint(x: 0.60561*width, y: 1.0249*height), control2: CGPoint(x: 0.37453*width, y: 1.04958*height))
        path.addLine(to: CGPoint(x: 0, y: 0.72285*height))
        path.addLine(to: CGPoint(x: 0, y: 0.48331*height))
        path.addCurve(to: CGPoint(x: 0.00452*width, y: 0.47388*height), control1: CGPoint(x: 0, y: 0.47951*height), control2: CGPoint(x: 0.0017*width, y: 0.47596*height))
        path.addLine(to: CGPoint(x: 0.15526*width, y: 0.36285*height))
        path.addCurve(to: CGPoint(x: 0.22817*width, y: 0.29738*height), control1: CGPoint(x: 0.18132*width, y: 0.34365*height), control2: CGPoint(x: 0.20573*width, y: 0.32173*height))
        path.addLine(to: CGPoint(x: 0.34585*width, y: 0.16967*height))
        path.closeSubpath()
        return path
    }
}


struct LineJejuDraw: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.34585*width, y: 0.172*height))
        path.addLine(to: CGPoint(x: 0.46855*width, y: 0.00772*height))
        path.addCurve(to: CGPoint(x: 0.49456*width, y: 0.00563*height), control1: CGPoint(x: 0.47515*width, y: -0.00112*height), control2: CGPoint(x: 0.48692*width, y: -0.00206*height))
        path.addLine(to: CGPoint(x: 0.49456*width, y: 0.00563*height))
        path.addCurve(to: CGPoint(x: 0.51795*width, y: 0.00641*height), control1: CGPoint(x: 0.50115*width, y: 0.01227*height), control2: CGPoint(x: 0.51102*width, y: 0.0126*height))
        path.addLine(to: CGPoint(x: 0.51949*width, y: 0.00504*height))
        path.addCurve(to: CGPoint(x: 0.54662*width, y: 0.00847*height), control1: CGPoint(x: 0.52783*width, y: -0.00241*height), control2: CGPoint(x: 0.53994*width, y: -0.00088*height))
        path.addLine(to: CGPoint(x: 0.65316*width, y: 0.15769*height))
        path.addLine(to: CGPoint(x: 0.65316*width, y: 0.15769*height))
        path.addCurve(to: CGPoint(x: 0.8489*width, y: 0.297*height), control1: CGPoint(x: 0.69949*width, y: 0.23154*height), control2: CGPoint(x: 0.76988*width, y: 0.28164*height))
        path.addLine(to: CGPoint(x: 0.92059*width, y: 0.31095*height))
        path.addCurve(to: CGPoint(x: 0.92481*width, y: 0.31376*height), control1: CGPoint(x: 0.92225*width, y: 0.31127*height), control2: CGPoint(x: 0.92375*width, y: 0.31227*height))
        path.addLine(to: CGPoint(x: 0.92481*width, y: 0.31376*height))
        path.addCurve(to: CGPoint(x: 0.99982*width, y: 0.55593*height), control1: CGPoint(x: 0.97337*width, y: 0.38258*height), control2: CGPoint(x: 0.99982*width, y: 0.46795*height))
        path.addLine(to: CGPoint(x: 0.99982*width, y: 0.68182*height))
        path.addLine(to: CGPoint(x: 0.74142*width, y: 0.85213*height))
        path.addLine(to: CGPoint(x: 0.74142*width, y: 0.85213*height))
        path.addCurve(to: CGPoint(x: 0.21249*width, y: 0.90847*height), control1: CGPoint(x: 0.60561*width, y: 1.02483*height), control2: CGPoint(x: 0.37453*width, y: 1.04944*height))
        path.addLine(to: CGPoint(x: 0, y: 0.72363*height))
        path.addLine(to: CGPoint(x: 0, y: 0.48476*height))
        path.addCurve(to: CGPoint(x: 0.00452*width, y: 0.47536*height), control1: CGPoint(x: 0, y: 0.48097*height), control2: CGPoint(x: 0.0017*width, y: 0.47743*height))
        path.addLine(to: CGPoint(x: 0.15526*width, y: 0.36463*height))
        path.addCurve(to: CGPoint(x: 0.22817*width, y: 0.29935*height), control1: CGPoint(x: 0.18132*width, y: 0.34549*height), control2: CGPoint(x: 0.20573*width, y: 0.32364*height))
        path.addLine(to: CGPoint(x: 0.34585*width, y: 0.172*height))
        path.closeSubpath()
        return path
    }
}
