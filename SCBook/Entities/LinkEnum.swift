//
//  LinkEnum.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/28.
//

//MARK: 원활한 Link용.

import SwiftUI

enum LinkType: String, Codable {
    case hig
    case noHig //noHig에서도 더 추가할거면 여기서 분류하면된다.
}

@ViewBuilder //MARK: 회고, 고찰 꼭 하기 필수!!! Essential
func view(cd: ColorDict, hig item: ListModel.HIG?, for type: LinkType) -> some View {
    switch type {
    case .hig:
        TransitionView(cd: cd, hig: item)
    case .noHig:
        BackgroundList(cd: cd)
    }
}
