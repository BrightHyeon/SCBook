//
//  OnboardingView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/27.
//

import SwiftUI
import SwiftUIX

struct Onboarding: View {
    
    @State var selection = 0
    
    var body: some View {
        ZStack {
            background
            
            TabView(selection: $selection) {
                OnboardingView().tag(0)
                OnboardingView().tag(1)
                OnboardingView().tag(2)
            }
            .tabViewStyle(PageTabViewStyle()) //Nice!
            //pageControl과 유사한 형태.
            //default와 달리, View가 올라가지도 않는다.
            .background {
                Face(selection: $selection).opacity(0.8)
            }
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
            //                .blur(radius: 3)
            //ZStack안에 바로 넣게되면, 위의 body의 OnboardingView도 Wave의 frame을 follow하게되며, 늘어나버림. 그것을 방지하기위해, ZStack블록 안이 아닌 LinearGradient에 바로 overlay하는 식으로 할 것임.
            //MARK: Wave()를 정의한 곳에서 Shape frame말고, 자체 frame까지 조절했던 것을 주석처리하니 이렇게해도 문제없이 나타남. 강의에선 왜 frame처리를 둘 다 했는지 알고싶다...
            //일단 로딩시간은 둘 다 동일하게 김 ㅋㅋㅋ
            
            Wave2()
            //                .blur(radius: 3)
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

struct OnboardingView: View {
    var body: some View { //정렬 중요.
        VStack(alignment: .leading, spacing: 16) {
            
            Text("120 hours of video")
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(.white.opacity(0.7))
            
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.8703334331512451, green: 0.6183333396911621, blue: 0.9333333373069763, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.7204166650772095, green: 0.7433750033378601, blue: 0.949999988079071, alpha: 1)), location: 0.4791666567325592),
                    .init(color: Color(#colorLiteral(red: 0.5936805605888367, green: 0.7471791505813599, blue: 0.8583333492279053, alpha: 0.8100000023841858)), location: 1)]),
                startPoint: UnitPoint(x: 6.22425467642394e-9, y: 0.5007257086104584),
                endPoint: UnitPoint(x: 1.0000000062242533, y: 0.5007256838410408))
            .frame(height: 140) //frame지정해줘야함.
            .mask{
                Text("Learn \ndesign \nand code")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                //maxWidth: .infinity로 설정함으로써 사용가능한 최대공간을 사용하도록~!
            }
            Text("Learn by building real apps using Swift, React, Flutter and more. Design files and source code are included for each course.")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.7))
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
        //circular를 쓰고, stroke을 주면 선이 좀 일그러지는 느낌을 본적있을 것! continuous에는 그런것없음.
        //MARK: Stroke 오버레이하는 타이밍 주의. 순서에 따라 바뀌니!
        .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous)
            .stroke(LinearGradient(
                gradient: Gradient(stops: [
            .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)), location: 0),
            .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)), location: 1)]),
                startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)), lineWidth: 1)
                .blendMode(.overlay)
                .overlay( //한번 더 오버레이하고,
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .stroke(LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)), location: 0),
                                .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)), location: 1)]),
                            startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                            endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)), lineWidth: 3)
                        .blur(radius: 10)
                    //이번엔 blur를 주면, 좀 더 glow적인 느낌연출됨.
                )
        )
        .background( //BlurView이용해서 배경만 blur처리하고, 너무진해지니까, 투명값있는 gradient를 fill해서 조절해줌.
            VisualEffectBlurView(blurStyle:
                    .systemUltraThinMaterialDark)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(LinearGradient(colors: [Color.red, Color.blue.opacity(0.0)], startPoint: .top, endPoint: .bottom))
                     )
        )
        .padding(20)
        //Stroke도 투명도를 한쪽에 줘야 배경에 스며드는 듯한 효과연출됨.
        //blendMode(.overlay)를 사용하면, 하위 레이어에 따라 상위레이어의 색이 강조된다. 하위가 밝으면 더밝아지고, 어두우면 더 어두워지는.
    }
}

//TODO: 기본 .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))와의 차이가 뭐지?!
