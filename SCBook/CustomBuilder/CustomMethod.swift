//
//  CustomMethod.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/05/02.
//

import SwiftUI

func partialColorString(all: String, allColor: Color, partial: String, partialColor: Color ) -> AttributedString {
    
    //NSMutableAttributedString -> 텍스트의 일부에 대한 관련 속성이 있는 수정 가능한 문자열 유형입니다.
    
    var attributedString = AttributedString(all) //attri형태로 타입변환 #단순 String타입에는 색상변경 등이 불가능하다.
    attributedString.foregroundColor = allColor //먼저 전체색상 지정
//    attributedString.font = .body.bold() //여기서 안해도됨. 오히려 View에서해야 다양한 weight적용가능.
    
    if let range = attributedString.range(of: partial) { //부분문자열 범위 탐색
        attributedString[range].foregroundColor = partialColor //그 범위에 적용
        attributedString[range].font = .body.bold()
    }
    //문제는 range의 경우, 처음에 나온 그 단어만 수정된다.
    
    return attributedString
}
//https://developer.apple.com/documentation/foundation/attributedstring 참고.
