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
