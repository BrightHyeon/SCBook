//
//  ColorViewModel.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/29.
//

import SwiftUI

//MARK: Question. class말고 더 좋은 관리방법은?
class ColorDict: ObservableObject {
    
    let background: AngularGradient = AngularGradient(
        gradient: Gradient(stops: [
            .init(color: Color(#colorLiteral(red: 0.9541666507720947, green: 0.6599652767181396, blue: 0.6599652767181396, alpha: 1)), location: 0.14326532185077667),
            .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), location: 0.4985717535018921),
            .init(color: Color(#colorLiteral(red: 0.9541666507720947, green: 0.6599652767181396, blue: 0.6599652767181396, alpha: 1)), location: 0.8701561689376831),
            .init(color: Color(#colorLiteral(red: 0.9041666388511658, green: 0.4596180319786072, blue: 0.4596180319786072, alpha: 1)), location: 0.9971840381622314)]),
        center: UnitPoint(x: 0.4999999056591794, y: 0.5000000405261534),
        angle: .init(degrees: 45)
    )
    
    let colors: [String: LinearGradient] = [
        
        "listText": LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.5529412031173706, green: 0.1725490242242813, blue: 0.7882353067398071, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.3176470696926117, green: 0.24705882370471954, blue: 0.7764706015586853, alpha: 1)), location: 0.4895833432674408),
                .init(color: Color(#colorLiteral(red: 0.08235294371843338, green: 0.019607843831181526, blue: 0.18431372940540314, alpha: 1)), location: 1)]),
            startPoint: UnitPoint(x: -1.557021853115792e-8, y: 0.3515624736324306),
            endPoint: UnitPoint(x: 1.0000000119047296, y: 0.6321022780204675)),
        
        "cellStroke": LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)), location: 0),
                .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)), location: 1)]),
            startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
            endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)),
        
        "onboardBackground": LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 1, green: 0.5833333730697632, blue: 0.9833333492279053, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.22892358899116516, green: 0.0164930522441864, blue: 0.3958333432674408, alpha: 1)), location: 1)]),
            startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
            endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)),
        
        "onboardText": LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.8703334331512451, green: 0.6183333396911621, blue: 0.9333333373069763, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.7204166650772095, green: 0.7433750033378601, blue: 0.949999988079071, alpha: 1)), location: 0.4791666567325592),
                .init(color: Color(#colorLiteral(red: 0.5936805605888367, green: 0.7471791505813599, blue: 0.8583333492279053, alpha: 0.8100000023841858)), location: 1)]),
            startPoint: UnitPoint(x: 6.22425467642394e-9, y: 0.5007257086104584),
            endPoint: UnitPoint(x: 1.0000000062242533, y: 0.5007256838410408)),
        
        "onboardingView": LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.12969449162483215, green: 0.05347222089767456, blue: 0.2916666567325592, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)), location: 1)]),
            startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
            endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)),
        
        "onboardStroke": LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)), location: 0),
                .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)), location: 1)]),
            startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
            endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)),
        
        "continueText": LinearGradient(colors: [Color.purple.opacity(0.9), Color.pink.opacity(0.9)], startPoint: .topLeading, endPoint: .bottomTrailing),
        
        "continueBackground": LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color.white.opacity(0.7), location: 0),
                .init(color: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), location: 1)]),
            startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
            endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999))
        
    
    ]
    
}
