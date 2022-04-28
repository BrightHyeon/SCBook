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
    let hig: HIG?
    
    struct HIG: Codable {
        let imageName: String
        let title: String
        let subtitle: String
        let introduce: String
        let description: String
    }
}

//image로 했었으니 @AppStorage는 image를 저장하지못함~!!



