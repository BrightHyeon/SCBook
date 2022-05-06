//
//  BasicButtonView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/29.
//

import SwiftUI

struct LazyVGridView: View {
    
    var gridItem: [GridItem] = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            ScrollView {
                LazyVGrid(columns: gridItem, spacing: 5) {
                    ForEach(0...100, id: \.self) { num in
                        
                        GroupBox {
                            Label("SwiftUI", systemImage: "heart.fill")
                        } content: {
                            Text("Day \(num)")
                        }
//                        .groupBoxStyle(DefaultGroupBoxStyle()) //default자체도 이쁨.
                        .groupBoxStyle(MyGroupBoxStyle())
                    }
                }
                .padding()
            }
        }
        .navigationTitle("VGrid&GroupBox")
    }
}

struct BasicButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGridView()
    }
}
//GroupBoxStyle프로토콜 채택
struct MyGroupBoxStyle: GroupBoxStyle {
    //준수위한 필수메서드 makeBody
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .center, spacing: 12) {
            configuration.label
                .lineLimit(1)
                .minimumScaleFactor(0.8)
                .font(.body.bold())
                .foregroundColor(.red)
            configuration.content
                .font(.subheadline.bold())
        }
        .padding()
        .background(Color.systemGroupedBackground)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

/*
 MARK: LazyVGrid & LazyHGrid
 
 V는 columns을, H는 rows를 설정.
 
 Lazy키워드가 붙은 애들은 View를 그려내야할때만(View과 User화면에 나타날 시점) View를 불러온다.
 -> ex) 그냥 VStack은 row가 100개면 100개를 한 번에 불러오고, LazyVStack은 100개를 스크롤이 내려감에따라 순차적으로 필요시 불러온다.
 
 LazyVGrid자체 Spacing도 정의할 수 있고, GridItem안에서의 Spacing도 정의할 수 있다. 기본값 nil. nil != 0
 
 정렬도 정의가능하고, LazyVGrid의 정렬은 기본 center이고, GridItem의 정렬은 기본 nil이다.
 -> 간단한 test결과, 정렬은 item에 넣든, Grid에 넣든 같은 효과가 나타남. 그냥 Grid에서만 설정해도될듯.
 
 Grid를 그리려면 GridItem을 필수로 정의해야한다.
 
 GridItem size에는 3가지 형태가 있음.
 .adaptive -> minimum사이즈만 정해주면 자기가 알아서 columns(열)의 갯수와 item의 크기를 설정한다. 또한 maximum사이즈도 설정해줄 수 있다.
 .flexible -> adaptive와 유사하지만, columns의 수는 개발자가 직접 설정해야한다.
 .fixed -> columns의 갯수와 item의 사이즈까지 개발자가 직접 설정한다.
 
 이렇게 GridItem틀을 맞추고 주로 ForEach를 통해 View를 그린다.
 
 보통? ScrollView안에 담아서 사용한다.
 
 Primary Points
 
 @ adaptive는 minimum사이즈 입력이 "필수사항" (사이즈기반으로 columns 갯수 정하니까~!)
 # [GridItem]배열에 1개의 GridItem만 존재하면된다. 그 이상 의미없음.
 # spacing값 입력하면 자신 오른쪽과의 간격 설정됨.
 
 @ flexible은 size입력안해도됨.
 # 특정 GridItem원소에 spacing값 입력하면 그 열의 바로 오른쪽 columns과의 간격이 설정됨.
 # [GridItem]배열에 입력한 원소 수 == colums 갯수
 
 @ fixed는 size 필수 입력.
 
 <장-단점 (내피셜)>
 장점.
 1. 배열형태의 데이터를 커스텀해서 뿌리기좋다.
 2. 스크롤바가 공간을 효율적으로 써서 보기좋은 위치에 나타난다.
 3. 기본 Lazy형태라서 View를 효율적으로 불러온다.
 4. 여러 줄로 유연성있게 item사이즈가 변했으면 좋겠을 때 사용하면 최고다.
 
 단점.
 1. 배열형태의 데이터를 뿌려야만한다.?
 2. 인스타처럼 서로 다른 크기의 item을 뿌리기는 힘들어보인다. VStack도 마찬가지지만... 기대했기에...
 */
