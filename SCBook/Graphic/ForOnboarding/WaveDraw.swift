//
//  WaveDraw.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/27.
//

import SwiftUI

struct WaveDraw: Shape { //여기서 그림먼저 그려주기. 까만배경임. 그리고 rect비율에 맞춰서 움직임.
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.05557*width, y: 0))
        path.addLine(to: CGPoint(x: 0.22224*width, y: 0.06107*height))
        path.addLine(to: CGPoint(x: 0.32292*width, y: 0.07734*height))
        path.addCurve(to: CGPoint(x: 0.49275*width, y: 0.13678*height), control1: CGPoint(x: 0.3807*width, y: 0.08668*height), control2: CGPoint(x: 0.43766*width, y: 0.10662*height))
        path.addLine(to: CGPoint(x: 0.57062*width, y: 0.17942*height))
        path.addCurve(to: CGPoint(x: 0.72758*width, y: 0.33552*height), control1: CGPoint(x: 0.62938*width, y: 0.21159*height), control2: CGPoint(x: 0.683*width, y: 0.26492*height))
        path.addLine(to: CGPoint(x: 0.72758*width, y: 0.33552*height))
        path.addCurve(to: CGPoint(x: 0.85849*width, y: 0.47575*height), control1: CGPoint(x: 0.76542*width, y: 0.39545*height), control2: CGPoint(x: 0.80985*width, y: 0.44304*height))
        path.addLine(to: CGPoint(x: 0.93781*width, y: 0.5291*height))
        path.addLine(to: CGPoint(x: 0.99794*width, y: 0.99303*height))
        path.addLine(to: CGPoint(x: 0.00218*width, y: 0.99303*height))
        path.addLine(to: CGPoint(x: 0.05557*width, y: 0))
        path.closeSubpath()
        return path
    }
}
