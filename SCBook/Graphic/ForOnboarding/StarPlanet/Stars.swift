//
//  Stars.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/27.
//

import SwiftUI

struct Stars: View {
    var body: some View {
        let star = Color.white
            .mask(
                StarDraw().frame(width: 10, height: 10)
                    .blur(radius: 2)
            )
            .frame(width: 10, height: 10)
        
        VStack(spacing: 50) {
            HStack(spacing: 50) {
                Spacer()
                star
                Spacer()
                star
                Spacer()
                star
            }
            HStack(spacing: 100) {
                Spacer()
                star
                star
                star
                Spacer()
            }
            HStack(spacing: 50) {
                star
                Spacer()
                star
                Spacer()
                Spacer()
                star
            }
            HStack(spacing: 70) {
                star
                Spacer()
                star
                Spacer()
                star
            }
            HStack(spacing: 70) {
                star
                Spacer()
                star
                Spacer()
                Spacer()
                star
            }
        }
        .frame(width: 300, height: 300)
    }
}

struct Stars_Previews: PreviewProvider {
    static var previews: some View {
        Stars()
    }
}
