//
//  GradientText.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/27.
//

import SwiftUI

struct GradientText: View {
    var body: some View {
        Text("Hello, world!")
            .font(.largeTitle)
            .bold()
            .foregroundLinearGradient(
                Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.5529412031173706, green: 0.1725490242242813, blue: 0.7882353067398071, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.3176470696926117, green: 0.24705882370471954, blue: 0.7764706015586853, alpha: 1)), location: 0.4895833432674408),
                    .init(color: Color(#colorLiteral(red: 0.08235294371843338, green: 0.019607843831181526, blue: 0.18431372940540314, alpha: 1)), location: 1)]),
                startPoint: UnitPoint(x: -1.557021853115792e-8, y: 0.3515624736324306),
                endPoint: UnitPoint(x: 1.0000000119047296, y: 0.6321022780204675))
    }
}

struct GradientText_Previews: PreviewProvider {
    static var previews: some View {
        GradientText()
    }
}

//MARK: mask()방식으로도 입힐 수 있지만 바로 foregroundStyle을 이용해서 입히는 것도 가능하다~!
