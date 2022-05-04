//
//  Cloud.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/28.
//

import SwiftUI

struct Cloud: View {
    var body: some View {
        
        //TODO: 아래 주석대로 적용하면 다른 뷰들이 밀리게 됨. 후에 원인파악바람.
        
        CloudDraw()
            .fill(
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color(#colorLiteral(red: 0.9725490212440491, green: 0.9882352948188782, blue: 0.9882352948188782, alpha: 1)), location: 0),
                        .init(color: Color(#colorLiteral(red: 0.8352941274642944, green: 0.9254902005195618, blue: 0.9254902005195618, alpha: 1)), location: 0.4947916567325592),
                        .init(color: Color(#colorLiteral(red: 0.9303819537162781, green: 0.9708333611488342, blue: 0.9708333611488342, alpha: 1)), location: 1)]),
                    startPoint: UnitPoint(x: -0.04225352010398306, y: 0.24896695779161476),
                    endPoint: UnitPoint(x: 1.251895998765015, y: 0.7117768865663061)))
            .frame(width: 80, height: 50)
            .opacity(0.8)
        
        //        LinearGradient(
        //            gradient: Gradient(stops: [
//                .init(color: Color(#colorLiteral(red: 0.9725490212440491, green: 0.9882352948188782, blue: 0.9882352948188782, alpha: 1)), location: 0),
//                .init(color: Color(#colorLiteral(red: 0.8352941274642944, green: 0.9254902005195618, blue: 0.9254902005195618, alpha: 1)), location: 0.4947916567325592),
//                .init(color: Color(#colorLiteral(red: 0.9303819537162781, green: 0.9708333611488342, blue: 0.9708333611488342, alpha: 1)), location: 1)]),
//            startPoint: UnitPoint(x: -0.04225352010398306, y: 0.24896695779161476),
//            endPoint: UnitPoint(x: 1.251895998765015, y: 0.7117768865663061))
//        .mask(
//            CloudDraw().frame(width: 80, height: 50)
//        )
    }
}

struct Cloud_Previews: PreviewProvider {
    static var previews: some View {
        Cloud()
    }
}
