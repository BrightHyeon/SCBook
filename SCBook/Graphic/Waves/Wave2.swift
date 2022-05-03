//
//  Wave2.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/27.
//

import SwiftUI

struct Wave2: View {
    var body: some View {
        LinearGradient(
                    gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.9777896404266357, green: 0.5019791722297668, blue: 0.987500011920929, alpha: 1)), location: 1)]),
                    startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                    endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999))
        .mask(WaveDraw().frame(width: 800, height: 500))
//        .frame(width: 800, height: 500)
        //줘야할 상황이있음. 그냥 해보고 frame짤린다싶으면 이거하면됨.
        //그림의 frame과 실제 갖는 공간의 frame을 동일하게 설정.
        //MARK: 내 Try; 바로 위코드를 주석처리해보니까, 직접 실제 View에 적용할 때 굳이 overlay로 안해도되게됨.
        .offset(x: 0, y: 300) //offset조절.
    }
}

struct Wave2_Previews: PreviewProvider {
    static var previews: some View {
        Wave2()
    }
}

struct BlueWave2: View {
    var body: some View {
        LinearGradient(
                    gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), location: 1)]),
                    startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                    endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999))
        .mask(WaveDraw().frame(width: 800, height: 500))
        .offset(x: 0, y: 300)
    }
}
