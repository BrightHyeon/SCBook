//
//  ListViewModel.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/28.
//

import SwiftUI

class ListViewModel: ObservableObject {
    
    @Published var list: [ListModel] = [
        ListModel(image: Image(systemName: "star.fill"), title: "Buttons", introduce: "Enter introduce"),
        ListModel(image: Image(systemName: "star.fill"), title: "Background", introduce: "Enter introduce"),
        ListModel(image: Image(systemName: "star.fill"), title: "TextField", introduce: "Enter introduce"),
        ListModel(image: Image(systemName: "star.fill"), title: "List", introduce: "Enter introduce"),
        ListModel(image: Image(systemName: "star.fill"), title: "SegmentedBar", introduce: "Enter introduce"),
        ListModel(image: Image(systemName: "star.fill"), title: "Text", introduce: "Enter introduce"),
        ListModel(image: Image(systemName: "star.fill"), title: "Image", introduce: "Enter introduce"),
        ListModel(image: Image(systemName: "star.fill"), title: "Transition", introduce: "Enter introduce"),
        ListModel(image: Image(systemName: "star.fill"), title: "Stepper", introduce: "Enter introduce")
    ]
}

class StartOnboard: ObservableObject {
    
    @AppStorage("isContinue") var isCountinue: Bool = false
    
}
