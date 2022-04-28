//
//  Curve.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/27.
//

import SwiftUI

struct Curve: View {
    var body: some View {
        Color.white
            .mask(
                CurveDraw()
                    .stroke()
                    .blur(radius: 1)
                    .opacity(0.5)
            )
    }
}

struct Curve_Previews: PreviewProvider {
    static var previews: some View {
        Curve()
    }
}
