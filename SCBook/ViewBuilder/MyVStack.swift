//
//  MyVStack.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/27.
//

import SwiftUI

struct MyVStack<Content: View>: View {
    
    @ViewBuilder let content: () -> Content
    
    var body: some View { //View프로토콜 자체가 반환타입이 될 수 없기에 some 키워드를 붙여서 "View 프로토콜을 준수하는 타입"을 반환타입으로 써라~ 라고 해준것이다.
        VStack {
            VStack(alignment: .leading, spacing: 10) { //정해진 틀 안에서 content()가 여러 자식 뷰를 반환하게 된다.
                content() //@ViewBuilder속성이기에 다중문 클로저이다. 여러 자식뷰를 반환할 수 있게된다.
            }
            Spacer()
            Group {
                
            }
        }
    }
}

struct MyVStackVersion2<Content>: View where Content: View {
    
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) { //함수의 매개변수로 전달된 클로저를 외부변수에 할당하려면 @escaping속성을 써줘야한다!
        self.content = content //초기화될때(= 메모리에 올라갈때), 내 content상수는 @ViewBuilder 속성이란 것을 지정한 것.
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                content()
            }
            Spacer()
        }
    }
}

