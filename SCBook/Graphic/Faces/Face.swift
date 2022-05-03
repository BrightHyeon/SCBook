//
//  Face.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/27.
//

import SwiftUI

struct Face: View {
    
    @State var appear = false
    @Binding var selection: Int
    @State var active = true
    
    let w = UIScreen.main.bounds.width / 10 //대략 40
    let h = UIScreen.main.bounds.height / 10 //대략 85
    
    var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.5529412031173706, green: 0.1725490242242813, blue: 0.7882353067398071, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.3176470696926117, green: 0.24705882370471954, blue: 0.7764706015586853, alpha: 1)), location: 0.4895833432674408),
                    .init(color: Color(#colorLiteral(red: 0.08235294371843338, green: 0.019607843831181526, blue: 0.18431372940540314, alpha: 1)), location: 1)]),
                startPoint: UnitPoint(x: -1.557021853115792e-8, y: 0.3515624736324306),
                endPoint: UnitPoint(x: 1.0000000119047296, y: 0.6321022780204675))
            .overlay(
                Line()
                    .offset(x: 30, y: 180)
            )
            .overlay(
                Line2()
                    .offset(x: 0, y: -155)
                    .opacity(0.3)
            )
            .overlay(
                Curve()
                    .frame(width: w*10, height: h*3)
                    .offset(x: 250, y: 100)
            )
            .overlay(
                Curve()
                    .frame(width: w*8, height: h*2.5)
                    .offset(x: 270, y: 130)
            )
            .overlay(
                Stars()
                    .offset(x: 100, y: 0)
            )
            .mask(FaceDraw())
            .frame(width: w*12, height: h*5)
            //MARK: 이러려고 frame주는 구나.
            .offset(x: -w*2, y: -h*3.8)
            
            ZStack {
                Planet1()
                    .offset(x: appear ? 100 : 0, y: appear ? 100 : -50)
                Planet2()
                    .offset(x: appear ? -100 : 0, y: appear ? -30 : -200)
                Planet3()
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
        if selection == 0 {
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

struct Face_Previews: PreviewProvider {
    static var previews: some View {
        Face(selection: .constant(0))
    }
}
