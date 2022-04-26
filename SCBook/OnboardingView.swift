//
//  OnboardingView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/27.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        ZStack {
            background
            
            TabView {
                OnboardingView()
                OnboardingView()
                OnboardingView()
            }
            .tabViewStyle(PageTabViewStyle()) //Nice!
            //pageControl과 유사한 형태.
            //default와 달리, View가 올라가지도 않는다.
        }
    }
    
    var background: some View { //이렇게 따로 뺀 후에 body에 추가가능.
        ZStack {
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 1, green: 0.5833333730697632, blue: 0.9833333492279053, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.22892358899116516, green: 0.0164930522441864, blue: 0.3958333432674408, alpha: 1)), location: 1)]),
                startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999))
            .ignoresSafeArea()
            //아래와 같은 효과.
            //.edgesIgnoringSafeArea(.all)
//            .overlay(
//                ZStack {
//                    Wave()
//                    Wave2()
//                }
//            )
            
            //TODO: 이 ZStack, overlay의 동작차이 원인 알아보기.
            
            Wave()
                .blur(radius: 3)
            //ZStack안에 바로 넣게되면, 위의 body의 OnboardingView도 Wave의 frame을 follow하게되며, 늘어나버림. 그것을 방지하기위해, ZStack블록 안이 아닌 LinearGradient에 바로 overlay하는 식으로 할 것임.
            //MARK: Wave()를 정의한 곳에서 Shape frame말고, 자체 frame까지 조절했던 것을 주석처리하니 이렇게해도 문제없이 나타남. 강의에선 왜 frame처리를 둘 다 했는지 알고싶다...
            //일단 로딩시간은 둘 다 동일하게 김 ㅋㅋㅋ
            
            Wave2()
                .blur(radius: 3)
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

struct OnboardingView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("120 hours of video")
                .font(.footnote)
                .fontWeight(.semibold)
            Text("Learn design and code")
                .font(.largeTitle)
                .bold()
            Text("Learn by building real apps using Swift, React, Flutter and more. Design files and source code are included for each course.")
                .font(.subheadline)
        }
        .padding(30)
        //figma에서 만든 여러 Components를 SwiftUI Inspector를 이용하여 code추출할 수 있는데 아래 Linear도 그런방식으로 가져옴.
        .background(LinearGradient(
            gradient: Gradient(stops: [
        .init(color: Color(#colorLiteral(red: 0.12969449162483215, green: 0.05347222089767456, blue: 0.2916666567325592, alpha: 1)), location: 0),
        .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)), location: 1)]),
            startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
            endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        //둘은 받는 전달인자타입이 다름. mask는 ()->View 즉, View를 반환하는 모든 요소를 받고, clipShape는 Shape를 받음.
        //.clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        //RoundedRectangleStyle - .continuous: smooth하게 이어지도록 처리함. .circular: 딱 지정한 부분만 radius주는데 다소 확 꺾이는듯함. 취향 차이. 즉, 더부드러운건 continuous!
        .padding(20)
    }
}
