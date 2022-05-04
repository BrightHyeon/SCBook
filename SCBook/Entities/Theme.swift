//
//  Theme.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/30.
//

import SwiftUI

struct Theme {
    static func backgroundStyle(forScheme scheme: ColorScheme) -> some View {
        let lightStyle = AngularGradient(
            gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.9541666507720947, green: 0.6599652767181396, blue: 0.6599652767181396, alpha: 1)), location: 0.14326532185077667),
                .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), location: 0.4985717535018921),
                .init(color: Color(#colorLiteral(red: 0.9541666507720947, green: 0.6599652767181396, blue: 0.6599652767181396, alpha: 1)), location: 0.8701561689376831),
                .init(color: Color(#colorLiteral(red: 0.9041666388511658, green: 0.4596180319786072, blue: 0.4596180319786072, alpha: 1)), location: 0.9971840381622314)]),
            center: UnitPoint(x: 0.4999999056591794, y: 0.5000000405261534),
            angle: .init(degrees: 45)
        ).ignoresSafeArea()
        let darkStyle = AngularGradient(
            gradient: Gradient(stops: [
        .init(color: Color(#colorLiteral(red: 0.11249999701976776, green: 0.10078124701976776, blue: 0.10078124701976776, alpha: 1)), location: 0.14326532185077667),
        .init(color: Color(#colorLiteral(red: 0.42500001192092896, green: 0.40552085638046265, blue: 0.40552085638046265, alpha: 1)), location: 0.4985717535018921),
        .init(color: Color(#colorLiteral(red: 0.09166666865348816, green: 0.08288194239139557, blue: 0.08288194239139557, alpha: 1)), location: 0.8701561689376831),
        .init(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), location: 0.9971840381622314)]),
            center: UnitPoint(x: 0.4999999056591794, y: 0.5000000405261534),
            angle: .init(degrees: 45)
        ).ignoresSafeArea()
        
        switch scheme { //기본적으로 ColorScheme은 light, dark 케이스가 존재.
        case .light:
            return lightStyle
        case .dark:
            return darkStyle
        @unknown default:
            return lightStyle
        }
        //코드상에서 바로 @Environment Value로 현재 ColorScheme이 무엇인지 가져오고, 그에 맞게 View에서 바로 할당할 수도 있음.
        //환경에서 지금 현재\나의 colorScheme상태값을 받아서 새로 만든 변수 colorScheme에 넣을게~ 이런말인가...
        //@Environment(\.colorScheme) var colorScheme: ColorScheme
        //ex) .foregroundColor(colorScheme == .light ? .orange : .yellow)
    }
    
    static func titleColor(forScheme scheme: ColorScheme) -> some View {
        let lightColor = LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.5529412031173706, green: 0.1725490242242813, blue: 0.7882353067398071, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.3176470696926117, green: 0.24705882370471954, blue: 0.7764706015586853, alpha: 1)), location: 0.4895833432674408),
                .init(color: Color(#colorLiteral(red: 0.08235294371843338, green: 0.019607843831181526, blue: 0.18431372940540314, alpha: 1)), location: 1)]),
            startPoint: UnitPoint(x: -1.557021853115792e-8, y: 0.3515624736324306),
            endPoint: UnitPoint(x: 1.0000000119047296, y: 0.6321022780204675))
        
        let darkColor = LinearGradient(
            gradient: Gradient(stops: [
        .init(color: Color(#colorLiteral(red: 0.6465625166893005, green: 0.41796875, blue: 0.9375, alpha: 1)), location: 0),
        .init(color: Color(#colorLiteral(red: 0.3835069537162781, green: 0.5502916574478149, blue: 0.9791666865348816, alpha: 1)), location: 0.4791666567325592),
        .init(color: Color(#colorLiteral(red: 0.7726215124130249, green: 0.5744097232818604, blue: 0.9708333015441895, alpha: 1)), location: 1)]),
            startPoint: UnitPoint(x: -0.016011642040829277, y: 0.4723756962583452),
            endPoint: UnitPoint(x: 1.088063983612613, y: 0.653314927456851))
        
        switch scheme {
        case .light:
            return lightColor
        case .dark:
            return darkColor
        @unknown default:
            return lightColor
        }
    }
    
    static func buttonColor(forScheme scheme: ColorScheme) -> LinearGradient {
        let lightButton = LinearGradient(gradient: Gradient(stops: [
            .init(color: Color(#colorLiteral(red: 0.9541666507720947, green: 0.6599652767181396, blue: 0.6599652767181396, alpha: 1)), location: 0.14326532185077667),
            .init(color: Color(#colorLiteral(red: 0.9041666388511658, green: 0.4596180319786072, blue: 0.4596180319786072, alpha: 1)), location: 0.9971840381622314)]),
                                         startPoint: .topLeading, endPoint: .bottomTrailing)
        
        let darkButton = LinearGradient(gradient: Gradient(stops: [
            .init(color: Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)), location: 0.14326532185077667),
            .init(color: Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), location: 0.9971840381622314)]),
                                        startPoint: .topLeading, endPoint: .bottomTrailing)
        
        switch scheme {
        case .light:
            return lightButton
        case .dark:
            return darkButton
        @unknown default:
            return lightButton
        }
    }
}
