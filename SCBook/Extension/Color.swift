//
//  Color.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/05/02.
//

import SwiftUI

extension Color {
    //For Neumorphism
    static let offWhite = Color(red: 225/255, green: 225/255, blue: 235/255)
    
    static let darkStart = Color(red: 50/255, green: 60/255, blue: 65/255)
    
    static let darkEnd = Color(red: 25/255, green: 25/255, blue: 30/255)
}

extension LinearGradient {
    init(_ colors: Color...) { //새로운 초기화 메서드 등록.
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    } //색만 입력하면 자동으로 시작과 끝 포인트는 고정값으로 지정되도록.
}

//extension, Protocol
