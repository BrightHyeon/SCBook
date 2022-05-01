//
//  FaceDraw.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/27.
//

import SwiftUI

struct FaceDraw: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.01729*width, y: 0.00041*height))
        path.addLine(to: CGPoint(x: 0.40188*width, y: 0.00041*height))
        path.addCurve(to: CGPoint(x: 0.4287*width, y: 0.00325*height), control1: CGPoint(x: 0.41087*width, y: 0.00041*height), control2: CGPoint(x: 0.41985*width, y: 0.00136*height))
        path.addLine(to: CGPoint(x: 0.6447*width, y: 0.0494*height))
        path.addCurve(to: CGPoint(x: 0.80913*width, y: 0.12744*height), control1: CGPoint(x: 0.70347*width, y: 0.06195*height), control2: CGPoint(x: 0.75943*width, y: 0.08851*height))
        path.addLine(to: CGPoint(x: 0.80913*width, y: 0.12744*height))
        path.addLine(to: CGPoint(x: 0.83845*width, y: 0.14954*height))
        path.addCurve(to: CGPoint(x: 0.88069*width, y: 0.18925*height), control1: CGPoint(x: 0.85367*width, y: 0.16102*height), control2: CGPoint(x: 0.86783*width, y: 0.17433*height))
        path.addLine(to: CGPoint(x: 0.90318*width, y: 0.21534*height))
        path.addCurve(to: CGPoint(x: 0.91651*width, y: 0.23693*height), control1: CGPoint(x: 0.90861*width, y: 0.22163*height), control2: CGPoint(x: 0.91311*width, y: 0.22892*height))
        path.addLine(to: CGPoint(x: 0.93367*width, y: 0.27732*height))
        path.addCurve(to: CGPoint(x: 0.9402*width, y: 0.28206*height), control1: CGPoint(x: 0.9349*width, y: 0.28023*height), control2: CGPoint(x: 0.93743*width, y: 0.28206*height))
        path.addLine(to: CGPoint(x: 0.9402*width, y: 0.28206*height))
        path.addCurve(to: CGPoint(x: 0.94746*width, y: 0.28989*height), control1: CGPoint(x: 0.94398*width, y: 0.28206*height), control2: CGPoint(x: 0.94714*width, y: 0.28546*height))
        path.addLine(to: CGPoint(x: 0.95241*width, y: 0.35717*height))
        path.addCurve(to: CGPoint(x: 0.94657*width, y: 0.36655*height), control1: CGPoint(x: 0.95273*width, y: 0.36157*height), control2: CGPoint(x: 0.95024*width, y: 0.36558*height))
        path.addLine(to: CGPoint(x: 0.94657*width, y: 0.36655*height))
        path.addCurve(to: CGPoint(x: 0.9407*width, y: 0.37516*height), control1: CGPoint(x: 0.94313*width, y: 0.36746*height), control2: CGPoint(x: 0.9407*width, y: 0.37103*height))
        path.addLine(to: CGPoint(x: 0.9407*width, y: 0.38618*height))
        path.addCurve(to: CGPoint(x: 0.93683*width, y: 0.39976*height), control1: CGPoint(x: 0.9407*width, y: 0.39108*height), control2: CGPoint(x: 0.93934*width, y: 0.39584*height))
        path.addLine(to: CGPoint(x: 0.93142*width, y: 0.4082*height))
        path.addCurve(to: CGPoint(x: 0.93037*width, y: 0.47167*height), control1: CGPoint(x: 0.91945*width, y: 0.42688*height), control2: CGPoint(x: 0.91903*width, y: 0.45246*height))
        path.addLine(to: CGPoint(x: 0.95371*width, y: 0.5112*height))
        path.addCurve(to: CGPoint(x: 0.98407*width, y: 0.54508*height), control1: CGPoint(x: 0.96174*width, y: 0.52482*height), control2: CGPoint(x: 0.97207*width, y: 0.53635*height))
        path.addLine(to: CGPoint(x: 0.99724*width, y: 0.55467*height))
        path.addCurve(to: CGPoint(x: 0.99665*width, y: 0.56545*height), control1: CGPoint(x: 1.00078*width, y: 0.55725*height), control2: CGPoint(x: 1.00045*width, y: 0.56342*height))
        path.addLine(to: CGPoint(x: 0.96548*width, y: 0.58209*height))
        path.addCurve(to: CGPoint(x: 0.95586*width, y: 0.62189*height), control1: CGPoint(x: 0.9525*width, y: 0.58903*height), control2: CGPoint(x: 0.94792*width, y: 0.60798*height))
        path.addLine(to: CGPoint(x: 0.95829*width, y: 0.62614*height))
        path.addCurve(to: CGPoint(x: 0.95675*width, y: 0.65135*height), control1: CGPoint(x: 0.96276*width, y: 0.63397*height), control2: CGPoint(x: 0.96212*width, y: 0.64435*height))
        path.addLine(to: CGPoint(x: 0.9538*width, y: 0.65519*height))
        path.addCurve(to: CGPoint(x: 0.95326*width, y: 0.67372*height), control1: CGPoint(x: 0.94981*width, y: 0.66039*height), control2: CGPoint(x: 0.94958*width, y: 0.66821*height))
        path.addLine(to: CGPoint(x: 0.95326*width, y: 0.67372*height))
        path.addCurve(to: CGPoint(x: 0.95499*width, y: 0.68798*height), control1: CGPoint(x: 0.95596*width, y: 0.67777*height), control2: CGPoint(x: 0.95662*width, y: 0.68321*height))
        path.addLine(to: CGPoint(x: 0.94959*width, y: 0.70373*height))
        path.addCurve(to: CGPoint(x: 0.94689*width, y: 0.72008*height), control1: CGPoint(x: 0.94781*width, y: 0.70893*height), control2: CGPoint(x: 0.94689*width, y: 0.71448*height))
        path.addLine(to: CGPoint(x: 0.94689*width, y: 0.75853*height))
        path.addCurve(to: CGPoint(x: 0.92348*width, y: 0.7997*height), control1: CGPoint(x: 0.94689*width, y: 0.77655*height), control2: CGPoint(x: 0.93766*width, y: 0.79279*height))
        path.addLine(to: CGPoint(x: 0.92348*width, y: 0.7997*height))
        path.addCurve(to: CGPoint(x: 0.89874*width, y: 0.80148*height), control1: CGPoint(x: 0.91564*width, y: 0.80352*height), control2: CGPoint(x: 0.90693*width, y: 0.80415*height))
        path.addLine(to: CGPoint(x: 0.78893*width, y: 0.76567*height))
        path.addCurve(to: CGPoint(x: 0.72099*width, y: 0.77981*height), control1: CGPoint(x: 0.76563*width, y: 0.75807*height), control2: CGPoint(x: 0.74064*width, y: 0.76327*height))
        path.addLine(to: CGPoint(x: 0.72099*width, y: 0.77981*height))
        path.addCurve(to: CGPoint(x: 0.70352*width, y: 0.79993*height), control1: CGPoint(x: 0.71432*width, y: 0.78543*height), control2: CGPoint(x: 0.70843*width, y: 0.79221*height))
        path.addLine(to: CGPoint(x: 0.70302*width, y: 0.80073*height))
        path.addCurve(to: CGPoint(x: 0.69016*width, y: 0.8913*height), control1: CGPoint(x: 0.6865*width, y: 0.8267*height), control2: CGPoint(x: 0.68171*width, y: 0.86045*height))
        path.addLine(to: CGPoint(x: 0.71093*width, y: 0.96713*height))
        path.addLine(to: CGPoint(x: 0.52383*width, y: 0.89712*height))
        path.addCurve(to: CGPoint(x: 0.35451*width, y: 0.87907*height), control1: CGPoint(x: 0.46919*width, y: 0.87666*height), control2: CGPoint(x: 0.41139*width, y: 0.8705*height))
        path.addLine(to: CGPoint(x: 0.35451*width, y: 0.87907*height))
        path.addCurve(to: CGPoint(x: 0.23608*width, y: 0.91982*height), control1: CGPoint(x: 0.31345*width, y: 0.88524*height), control2: CGPoint(x: 0.27348*width, y: 0.899*height))
        path.addLine(to: CGPoint(x: 0.21517*width, y: 0.93146*height))
        path.addCurve(to: CGPoint(x: 0.08136*width, y: 0.98211*height), control1: CGPoint(x: 0.17264*width, y: 0.95514*height), control2: CGPoint(x: 0.12766*width, y: 0.97217*height))
        path.addLine(to: CGPoint(x: 0, y: 0.99959*height))
        path.addLine(to: CGPoint(x: 0.01729*width, y: 0.00041*height))
        path.closeSubpath()
        return path
    }
}
