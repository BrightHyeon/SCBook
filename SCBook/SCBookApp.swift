//
//  SCBookApp.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/26.
//

import SwiftUI

@main
struct SCBookApp: App {
    
    let startOnboard = StartOnboard()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(startOnboard)
        }
    }
}

/*
 PROBLEM, QUESTION
 
 <TODO>
 // GCD DispatchTime 이용해서 초반 온보딩 로직 이상한거 수정하기.
 1. 스크롤 내린 후 Link타고 이동하면, LargeTitle이 잘려있음.!!...
 2. namespace HIGView를 스크롤내리는 행위로도 닫을 수 있도록하고, xmark버튼과 함께 움직이도록 해보기. like AppStoreApp
 3. Enum + @ViewBuilder사용해서, hig vs nohig 나누기.
    -> 같은 hig case는 같은 틀에서 다른 내용으로 쓰일 수 있도록하기.
 4. nohig case는 바로 디자인 볼 수 있도록 하기.
 5. 메인리스트뷰에서 info버튼 누르면, 다시 온보딩화면으로 갈 수 있도록 false값 주기.
 6. 이후 배경 디자인들부터 만들어놓은거 넣고, 그 이후에 버튼들 basic부터해서 나열할 것.
    -> 나열할 때는 tech core 중 잘 안써본 keyword사용해서 해보기.
 7. sidebar도 써보고프다.
 */
