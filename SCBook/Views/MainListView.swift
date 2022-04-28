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
    
    @StateObject var listViewModel = ListViewModel()
    @StateObject var cd = ColorDict()
    @State private var text: String = ""
    let onboard: String = "Onboard"
    
    var body: some View {
        NavigationView {
            ZStack {
                background
                ScrollView {
                    VStack {
                        
                        SearchBar("Search...", text: $text).padding(.horizontal, 5)
                        
                        //index와 item을 동시에 빼줄수도있음... 단, Array로 한번더 덮어줘야하나봄.
//                        ForEach(Array(listViewModel.list.enumerated()), id: \.offset) { index, item in
                        ForEach(listViewModel.list, id: \.title) { item in
                            NavigationLink {
                                //실제 코드적용할 땐 enum case hashig인 애들만 여기로 전송할 것임.
                                TransitionView(hig: item.hig)
                            } label: {
                                ListCell(cd: cd, item: item)
                            }
                        }
                    }
                }
            }
            .navigationTitle("SCBook")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        startOnboard.isCountinue = false
                    } label: {
                        Image(systemName: "info.circle")
                            .font(.title3, weight: .bold)
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
    
    var background: some View {
        cd.background
        .ignoresSafeArea()
    }
}

struct ListCell: View {
    
    @ObservedObject var cd: ColorDict
    var item: ListModel
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 8) {
                
                cd.colors["listText"]
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
                    .foregroundColor(.black.opacity(0.7))
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

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(StartOnboard())
    }
}
