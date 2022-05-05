//
//  SCBookApp.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/26.
//

import SwiftUI
@main
struct SCBookApp: App {
    
    //UIKit에서 대리자(delegate)를 제공하는데 앱에서 사용되는 속성 래퍼.
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
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
 // GCD DispatchTime 이용해서 초반 온보딩 로직 이상한거 수정하기. - cannot. but use animation - solve...
 
 1. 스크롤 내린 후 Link타고 이동하면, LargeTitle이 잘려있음.!!... -> 그냥 이전 navigationStack과 이어지는듯? -> hmm....
 
 2. namespace HIGView를 스크롤내리는 행위로도 닫을 수 있도록하고, xmark버튼과 함께 움직이도록 해보기. like AppStoreApp - solve...
 3. Enum + @ViewBuilder사용해서, hig vs nohig 나누기.
    -> 같은 hig case는 같은 틀에서 다른 내용으로 쓰일 수 있도록하기. -> solve...
 4. nohig case는 바로 디자인 볼 수 있도록 하기. -> solve...
 5. 메인리스트뷰에서 info버튼 누르면, 다시 온보딩화면으로 갈 수 있도록 false값 주기. -> solve...
 
 6. 이후 배경 디자인들부터 만들어놓은거 넣고, 그 이후에 버튼들 basic부터해서 나열할 것. -> solve...
    -> 나열할 때는 tech core 중 잘 안써본 keyword사용해서 해보기. -> solve...
 
 7. sidebar도 써보고프다. -> Just...
 
 8. Dark Mode용 Setting. -> solve...
 
 9. file 삭제할 때 참조덩어리도 삭제하는법?! -> Just...
 
 10. neumorphism할 때 했던 방법 응용해서 PinkButton다시 잘 만들수없는지 생각해보기. -> Just...
 
 11. Geometry안쓰고도 잘 정렬할 수 있는 방법 찾기 feat.ButtonStyle -> Just...
 
 12. launchScreen만들기. -> solve...
 
 13. Font 정리 -> solve...
 
 14. 주석 정리 -> solve...
 
 15. Text Rotation -> solve...
 
 16. 3D effect활용한 Page Transition 구현해보기.
 
 //MARK: 해볼것들
 17. 붉은 글씨 써보기. HIG.
 18. HIGCell-> HIGView 전환 때 글씨 깨지는 거 수정하기.
 19. NavigationTitle안달린것들 달기.
 */

//MARK: 나중에 NC1 끝나고 고찰해봐야할 것 -> 재사용성 측면문제!!!. 단순 @ViewBuilder커스텀뷰, Modifier만이 능사가 아니다!!!. extenstion 및 View 이외의 프로토콜들도 Custom할줄 알아야 일류~!!!

/*
 Toggle 고찰. 내가 아는 그 토클모양만 있는 것이아니었음.
 그냥 true false가 버튼을 눌렀을 때, 변한값이 고정되는 것이 바로 Toggle~!
 */
