//
//  ListModel.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/28.
//

import SwiftUI

struct ListModel: Codable {
    let imageName: String
    let title: String
    let introduce: String
    let hig: HIG? //여기서 nil을 가질 수도 있고, @ViewBuilder함수인 view에서도 nil을 받을 수 있기 때문에 문제없음.
    var isHig: LinkType { //계산로직.
        if hig == nil {
            if title == "Background" {
                
                return .background
                
            } else if title == "LayoutStyle" {
                
                return .layoutStyle
                
            } else {
                
                return .background //오류대비 기본값.
                
            }
        } else {
            return .hig
        }
    }
    
    struct HIG: Codable {
        let imageName: String
        let title: String
        let subtitle: String
        let introduce: String
        let description: String
    }
}

//image로 했었으니 @AppStorage는 image를 저장하지못함~!!



