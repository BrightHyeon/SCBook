//
//  CustomButtonView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/30.
//
//  youtube - SwiftUI lazy compositional layout 영상 참고.

import SwiftUI

//MARK: Building Custom View like ForEach                                                   //아래 프로토콜 준수하려면 Element가 Hashable해야함.
struct CustomLayout<Content, Item, ID>: View where Content: View, ID: Hashable, Item: RandomAccessCollection, Item.Element: Hashable {
    
    var content: (Item.Element) -> Content
    var items: Item
    var id: KeyPath<Item.Element, ID> //item의 Element의 hashable한 id를 기반으로 경로찾아 참조하기.
    var spacing: CGFloat
                                                    //@ViewBuilder: 다중문 클로저 지원. @escaping: 탈출해서 해당클로저 값을 외부 변수에 할당가능하게만들기.
    init(items: Item, id: KeyPath<Item.Element, ID>, spacing: CGFloat = 5, @ViewBuilder content: @escaping (Item.Element) -> Content) {
        self.content = content
        self.id = id
        self.items = items //RandomAccessCollection - 시간복잡도 효율성 굳. O(1)
        self.spacing = spacing //외부변수에 바로 값할당해도되지만, 이렇게 해놓으면 이 구조체의 인스턴스를 생성할 때 초깃값을 수정해줄 수도 있게되니 이렇게~!
    }
    
    var body: some View {
        LazyVStack(spacing: spacing) { //Item.Element == row, So Item.Element: Hasable해야함.
            ForEach(generateColumns(), id: \.self) { row in
                RowView(row: row)
            }
        }
    }
    
    //MARK: Identifying Row Type
    func layoutType(row: [Item.Element]) -> LayoutType {
        let index = generateColumns().firstIndex { item in
            return item == row //columns에서 해당 row와 일치한 놈의 index찾기.
        } ?? 0
        
        //MARK: Layout Order will be 1,2,3,1,2,3.....
        var types: [LayoutType] = []
        generateColumns().forEach { _ in //row에 직접접근하진않고, row개수만큼 타입을 미리 등록하기.
            if types.isEmpty {
                types.append(.type1)
            } else if types.last == .type1 {
                types.append(.type2)
            } else if types.last == .type2 {
                types.append(.type3)
            } else if types.last == .type3 {
                types.append(.type4)
            } else if types.last == .type4 {
                types.append(.type1)
            } else { }
        }
        return types[index] //types란 틀안에서 Index찾기. row에 그 해당타입을 적용하도록.
    }
    
    //MARK: Row View
    @ViewBuilder
    func RowView(row: [Item.Element]) -> some View {
        GeometryReader { proxy in //자신이 속한 공간안에서의 GeometryProxy.size를 제공할 수 있음.
            let width = proxy.size.width
            let height = (proxy.size.height - spacing) / 2
            let type = layoutType(row: row)
            let columnWidth = (width - spacing * 2) / 3
            
            HStack(spacing: spacing) {
                //MARK: This Order is Your Wish
                if type == .type1 {
                    safeView(row: row, index: 0)
                    VStack(spacing: spacing) {
                        safeView(row: row, index: 1)
                            .frame(height: height) //내가 속한 VStack의 높이에서 spacing빼고 2로 나눈 높이.
                        safeView(row: row, index: 2)
                            .frame(height: height)
                    }
                    .frame(width: columnWidth)
                }
                if type == .type2 {
                    safeView(row: row, index: 0)
                        .frame(width: columnWidth)
                    safeView(row: row, index: 1)
                        .frame(width: columnWidth)
                    safeView(row: row, index: 2)
                        .frame(width: columnWidth)
                }
                if type == .type3 {
                    VStack(spacing: spacing) {
                        safeView(row: row, index: 1)
                            .frame(height: height)
                        safeView(row: row, index: 2)
                            .frame(height: height)
                    }
                    .frame(width: columnWidth)
                    safeView(row: row, index: 0)
                }
                if type == .type4 {
                    safeView(row: row, index: 0)
                        .frame(width: columnWidth)
                    safeView(row: row, index: 1)
                        .frame(width: columnWidth)
                    safeView(row: row, index: 2)
                        .frame(width: columnWidth)
                }
            }
        } //GeometryReader의 frame.
        .frame(height: layoutType(row: row) == .type1 || layoutType(row: row) == .type3 ? 250 : 125)
    }
    
    //MARK: Safely Unwrapping Content Index
    @ViewBuilder
    func safeView(row: [Item.Element], index: Int) -> some View {
        if (row.count - 1) >= index {
            content(row[index])
        }
    }
    
    
    //MARK: Constructing Custom Rows And Columns
    func generateColumns() -> [[Item.Element]] { //[Item.Element] 배열하나가 하나의 row이고 이들이모인것이 columns.
        var columns: [[Item.Element]] = []
        var row: [Item.Element] = []
        
        for item in items { //items는 RandomAccessCollection. 즉, item == Item.Element == RandomAccessCollection.Element임.
            //MARK: Each Row Consists of 3 Views == 하나의 row당 3개의 Views를 포함.
            //Optinal You can Modify
            if row.count == 3 {
                columns.append(row)
                row.removeAll()
                row.append(item)
            } else {
                row.append(item)
            }
        }
        //만약 items가 [1...8]이라면,
        //[[1,2,3],[4,5,6]] => columns
        //row = [7,8]
        
        //MARK: Adding Exhaust Ones
        columns.append(row)
        row.removeAll()
        
        //[[1,2,3],[4,5,6],[7,8]] => columns
        //row = []
        
        return columns
    }
    
}

//MARK: Identifying row type
enum LayoutType {
    case type1
    case type2
    case type3
    case type4
}
