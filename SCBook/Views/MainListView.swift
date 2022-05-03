//
//  MainListView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/27.
//

import SwiftUI
import SwiftUIX

struct MainListView: View {
    
    @EnvironmentObject var startOnboard: StartOnboard
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var opacity: Double = 0.0

    @StateObject var listViewModel = ListViewModel()
    @StateObject var cd = ColorDict()
    @State private var text: String = ""
    @Namespace var topID //위로 한번에 이동하기 위한 용도.
    //이거 관련해서는 따로 NC1_Tamna에 정리하겠음.
//    @State var proxyMemory:
    
    var body: some View {
        NavigationView {
            ScrollViewReader { proxy in
                ZStack {
                    Theme.backgroundStyle(forScheme: colorScheme)
                    ScrollView {
                        VStack {
                            
                            SearchBar("Search...", text: $text).padding(.horizontal, 5)
                                .id(topID)
                                .overlay(
                                    GeometryReader { proxy -> Color in //Color는 단순히 View return 용도.
                                        let offset = proxy.frame(in: .global).minY //frame에 4가지 요소가 있는데 그 중 y축과 관련된 minY.
                                        
                                        if offset < -70 { //proxy값 관찰용.
                                            withAnimation {
                                                self.opacity = 1
                                            }
                                        } else {
                                            withAnimation {
                                                self.opacity = 0
                                            }
                                        }
                                        return Color.clear //clear라서 영향없음.
                                    }
                                )
                            
                            
                            //index와 item을 동시에 빼줄수도있음... 단, Array로 한번더 덮어줘야하나봄.
                            //                        ForEach(Array(listViewModel.list.enumerated()), id: \.offset) { index, item in
                            ForEach(listViewModel.list, id: \.title) { item in
                                NavigationLink {
                                    //실제 코드적용할 땐 enum case hashig인 애들만 여기로 전송할 것임.
                                    view(hig: item.hig, for: item.isHig)
                                } label: {
                                    ListCell(cd: cd, item: item)
                                }
                            }
                        }
                    }
                    
                    Button {
                        withAnimation {
                            proxy.scrollTo(topID)
                        }
                    } label: {
                        Image(systemName: "chevron.up.circle.fill")
                            .font(.largeTitle, weight: .bold)
                            .foregroundColor(colorScheme == .light ? .pink : .gray)
                            .shadow(color: .primary, radius: 2, x: 2, y: 2)
                        //.label == .primary
                            .opacity(opacity)
                    }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        .padding()
                }
                .navigationTitle("SCBook")
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Button {
                            withAnimation(.linear(duration: 1)) {
                                startOnboard.isCountinue = false
                            }
                        } label: {
                            Image(systemName: "info.circle")
                                .font(.title3, weight: .bold)
                                .foregroundColor(.primary)
                        }
                    }
                }
            }
        }
    }
}

struct ListCell: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @ObservedObject var cd: ColorDict
    var item: ListModel
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 8) {
                
                Theme.titleColor(forScheme: colorScheme)
                    .frame(height: 30)
                    .mask(
                        Text(item.title)
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                    )
                Text(item.introduce)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary.opacity(0.7))
            }
            
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 20)
        .background {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .stroke(cd.colors["cellStroke"]!, lineWidth: 1)
                .blendMode(.overlay)
        }
    }
}

//struct MainListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainListView()
//            .environmentObject(StartOnboard())
//    }
//}
