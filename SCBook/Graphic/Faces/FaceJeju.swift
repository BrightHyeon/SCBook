//
//  FaceJeju.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/28.
//

import SwiftUI

struct FaceJeju: View {
    
    @State var appear = false
    @Binding var selection: Int
    @State var active = true
    
    let w = UIScreen.main.bounds.width / 10 //대략 40
    let h = UIScreen.main.bounds.height / 10 //대략 85
    
    var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.5333333611488342, green: 0.886274516582489, blue: 0.9960784316062927, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.7568627595901489, green: 0.929411768913269, blue: 0.9647058844566345, alpha: 1)), location: 0.2708333432674408),
                    .init(color: Color(#colorLiteral(red: 0.8745098114013672, green: 0.9686274528503418, blue: 0.9882352948188782, alpha: 1)), location: 0.4947916567325592),
                    .init(color: Color(#colorLiteral(red: 0.6235294342041016, green: 0.9137254953384399, blue: 0.9803921580314636, alpha: 1)), location: 0.7291666865348816),
                    .init(color: Color(#colorLiteral(red: 0.8784313797950745, green: 0.9843137264251709, blue: 0.9921568632125854, alpha: 1)), location: 1)]),
                startPoint: UnitPoint(x: 8.04390126729615e-9, y: 0.24876544266500578),
                endPoint: UnitPoint(x: 0.9999999639337407, y: 0.914197517291691))
            .overlay(
                LineJeju() //색변화
                    .offset(x: 30, y: 180)
            )
            .overlay(
                LineJeju2() //색변화
                    .offset(x: 0, y: -150)
                    .opacity(0.3)
            )
//            .overlay(
//                Curve()
//                    .frame(width: w*10, height: h*3)
//                    .offset(x: 250, y: 100)
//            ) //바람넣자.
//            .overlay(
//                Curve()
//                    .frame(width: w*8, height: h*2.5)
//                    .offset(x: 270, y: 130)
//            ) //구름넣자
            .mask(FaceDraw())
            .frame(width: w*12, height: h*5)
            //MARK: 이러려고 frame주는 구나.
            .offset(x: -w*2, y: -h*3.8)
            
            ZStack { //귤넣자.
                Cloud()
                    .offset(x: appear ? 200 : -200, y: -100)
                Cloud()
                    .offset(x: appear ? 200 : -100, y: -150)
                Cloud()
                    .offset(x: appear ? 600 : 0, y: -200)
                Orange()
                    .offset(x: appear ? 100 : 0, y: appear ? 100 : -50)
                Orange()
                    .offset(x: appear ? 50 : -50, y: appear ? -100 : 100)
            }
        }
        .opacity(active ? 1 : 0) //face 보였다 안보였다가.
        .onAppear {
            update() //얘때문인데... Face도 애니메이션으로 움직이는데 왜지?
        }
        .onChange(of: selection) { value in
            update()
        }
    }
    
    func update() {
        if selection == 1 {
            withAnimation(.linear(duration: 10)) {
                appear = true
                //이 구조체 자체가 Binding selection에 묶여서 그른가...
            }
            withAnimation {
                active = true
            }
        } else {
            withAnimation(.linear(duration: 10)) {
                appear = false
            }
            withAnimation {
                active = false
            }
        }
    }
}

struct FaceJeju_Previews: PreviewProvider {
    static var previews: some View {
        FaceJeju(selection: .constant(1))
    }
}
