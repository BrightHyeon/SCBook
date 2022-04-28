//
//  ListViewModel.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/27.
//

import SwiftUI

class ListViewModel: ObservableObject {
    
    @Published var list: [ListModel] = [
        ListModel(title: "Button", description: "Let's see variable design of "),
        ListModel(title: "Background", description: "Let's see variable design of "),
        ListModel(title: "TextField", description: "Let's see variable design of "),
        ListModel(title: "List", description: "Let's see variable design of "),
        ListModel(title: "SegmentedBar", description: "Let's see variable design of "),
        ListModel(title: "Text", description: "Let's see variable design of "),
        ListModel(title: "Image", description: "Let's see variable design of "),
        ListModel(title: "Stepper", description: "Let's see variable design of ")
    ]
}
