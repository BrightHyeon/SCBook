//
//  TransitionView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/28.
//

import SwiftUI

struct TransitionView: View {
    //@Namespace 라는 데코레이터가 생겼고 이를 사용하는 .matchedGeometryEffect(id:, in:) 이 생겼네요. 분명히 다른 뷰인데 서로 같은 셀을 다룬다는걸 알려줘서 셀 자체가 뷰에서 뷰로 이동하는 예제입니다. 굉장하네요!
    @Namespace var namespace
    @State private var show = false
    
    var body: some View {
        ZStack {
            background
            
            ScrollView {
                
                Text("Human Interface Guideline".uppercased())
                    .font(.body.weight(.semibold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                
                if !show {
                    HigCellView(namespace: namespace)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                show.toggle()
                            }
                        }
                }
            }
            
            if show {
                HIGView(namespace: namespace, show: $show)
            }
        }
        .navigationTitle("BUTTONS")
        .navigationBarTitleDisplayMode(.large)
    }
    
    var background: some View {
        AngularGradient(
            gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.9541666507720947, green: 0.6599652767181396, blue: 0.6599652767181396, alpha: 1)), location: 0.14326532185077667),
                .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), location: 0.4985717535018921),
                .init(color: Color(#colorLiteral(red: 0.9541666507720947, green: 0.6599652767181396, blue: 0.6599652767181396, alpha: 1)), location: 0.8701561689376831),
                .init(color: Color(#colorLiteral(red: 0.9041666388511658, green: 0.4596180319786072, blue: 0.4596180319786072, alpha: 1)), location: 0.9971840381622314)]),
            center: UnitPoint(x: 0.4999999056591794, y: 0.5000000405261534),
            angle: .init(degrees: 45)
        )
        .ignoresSafeArea()
    }
}

struct TransitionView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionView()
    }
}

/*
 //@Namespace 라는 데코레이터가 생겼고 이를 사용하는 .matchedGeometryEffect(id:, in:) 이 생겼네요. 분명히 다른 뷰인데 서로 같은 셀을 다룬다는걸 알려줘서 셀 자체가 뷰에서 뷰로 이동하는 예제입니다. 굉장하네요!
 
 //mathchedGeometryEffect()쓰면, transition이 perfect하게 된다고함.
 
 //같은 id의 namespace끼리 Modifier 차이가 있으면 animation이 깔끔하지않음.
 //물론 다 중요하겠지만, 수정자가 어느 것에는 잇고, 어느것에는 없는 것의 차이가 더 큼.
 
 //뷰 - 뷰 : 서로 바라보는 View요소(Text, Button, etc)등을 쌍으로 묶어줘야한다. 쌍마다 id이름은 달라야할 것이고, 이렇게 일일이 짝을 지어주어야 View가 transition될 때 perfectly하게 전환된다.
 
 //심지어 .background 가 변할 때도, 두 뷰의 공간 크기가 다를 때, matchGeome~~를 적용하면 부드럽게 전환된다.
 
 //App Store App처럼 bound되는 전환의 경우 단순히 withAnimation부분에 .spring(response: 0.6, dampingFraction: 0.8) 을 적용한 것 뿐이다.
 */
