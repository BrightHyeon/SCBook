//
//  ListViewModel.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/28.
//

import SwiftUI

class ListViewModel: ObservableObject {
    
    //MARK: PROBLEM, QUESTION - @AppStorage가 배열형태는 저장을 못하는 듯함. Bool, Int, Double, URL, Data타입만 저장함. 엥 Data..hmm...
    
    @Published var list: [ListModel] = loadJson("dummyList.json")
        
    //고찰 - 이 ViewModel 필요 no. 그냥 MainListView에서 바로 받아도됐음. 데이터의 변화가 생기는 것도 아니기에 단순 상수에 저장해도되는.
}

func loadJson<T: Decodable>(_ filename: String) -> T {
    
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }
}




class StartOnboard: ObservableObject {
    
    @AppStorage("isContinue") var isCountinue: Bool = false
    
}
