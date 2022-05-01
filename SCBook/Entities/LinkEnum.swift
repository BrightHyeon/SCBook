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
/*
 일반적으로, 원론적으로 함수는 single return type을 기대한다.
 
 some 키워드는 Opaque type(불투명, 불특정한 타입)을 말한다. View라는 프로토콜 자체가 반환타입이 될 수 없지만 some View처럼 some 키워드를 붙여주면,
 View 프로토콜을 준수하는 타입이란 뜻이된다. 즉 View프로토콜을 준수하는 타입이면 반환될 수 있다.
 
 하지만 some하나 붙였다고해서 다양한 View타입을 반환할 수 있는 것은 아니다. 결국 반환되는 View타입은 한 가지 타입이어야한다.
 그래서 some View타입 프로퍼티를 만들었을 때 결국 반환되는 타입으로 인식되는 것은 최상단에서 덮여진 그놈이다. ex) NavigationView or ScrollView or VStack etc.
 
 한 가지 타입이어야하고, 하나의 return값이어야한다.
 허나 @ViewBuilder속성이 정의되어있으면 다중클로저 지원으로 인해, View프로토콜을 준수하는 자식뷰들을 최대10개까지 빌딩할 수 있게되고, 여러 타입의 View를 지원한다. View프로토콜만 준수하는 놈이라면~!!!
 
 위의 코드에서 @ViewBuilder가 없다면 return 타입들이 둘 다 some View이긴 해도 결국 원론적으로는 다른 View타입이기 때문에 에러가난다.
 ex) 만약 둘다 Text타입이거나, Image타입이거나, 컬러타입이거나 등등 명확한 타입이였다면 에러가 나지않지만, 커스텀으로 만든 저 위의 뷰들은 뷰프로토콜을 준수하는 다른 뷰이다.
 
 이들을 AnyView로 덮어서 둘다 AnyView라는 타입으로 보이게함으로써 처리도 가능하지만, 이는 실제 타입은 결국 바뀐 것이기에 WWDC에서는 @ViewBuilder를 사용하길 권장한다. 이를 사용하면 여러 View타입을 지원하기에 가능해지기 때문.
 
 +) 혹은 Group으로 switch문 자체를 묶어도 된다. -> Group역시 Builder중 하나이기 때문~!!! 오히려 ViewBuilder보다도 상위개념으로 안다. 암튼 얘도 다중View타입을 지원.
 */
