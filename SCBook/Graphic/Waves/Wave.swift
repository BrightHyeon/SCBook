//
//  Wave.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/27.
//

//고찰 - Graphic파트 전체 고찰. 여기서 틀을 정해줄때, GeometryReader를 이용하면 보다 다양한 크기의 디바이스에서도 형태 및 위치가 잘 유지될 것으로 보인다.

import SwiftUI

//참고url: https://quassum.github.io/SVG-to-SwiftUI/

//제대로 그려주기 위해 frame설정하고, 그라데이션 주기.
struct Wave: View {
    var body: some View {
        LinearGradient(
                    gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.9583333134651184, green: 0.12378472089767456, blue: 0.12378472089767456, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.7951979041099548, green: 0.15156251192092896, blue: 0.8083333373069763, alpha: 1)), location: 1)]),
                    startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                    endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999))
        .mask(WaveDraw().frame(width: 600, height: 700))
//        .frame(width: 600, height: 700)
        //그림의 frame과 실제 갖는 공간의 frame을 동일하게 설정.
        //MARK: 내 Try; 바로 위코드를 주석처리해보니까, 직접 실제 View에 적용할 때 굳이 overlay로 안해도되게됨.
        .offset(x: 50, y: 300) //offset조절.
    }
}

struct Wave_Previews: PreviewProvider {
    static var previews: some View {
        Wave()
    }
}

struct BlueWave: View {
    var body: some View {
        LinearGradient(
                    gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)), location: 1)]),
                    startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                    endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999))
        .mask(WaveDraw().frame(width: 600, height: 700))
        .offset(x: 50, y: 300)
    }
}
