//
//  MainListView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/27.
//

import SwiftUI
import SwiftUIX

enum ListCase {
    case button
    case background
    case textField
}

struct MainListView: View {
    
    @StateObject var listViewModel = ListViewModel()
    @State private var text: String = ""
    let onboard: String = "Onboard"
    
    var body: some View {
        NavigationView {
            ZStack {
                background
                ScrollView {
                    VStack {
                        
                        SearchBar("Search...", text: $text).padding(.horizontal, 5)
                        
                        ForEach(listViewModel.list, id: \.title) { item in
                            NavigationLink {
                                TransitionView()
                            } label: {
                                ListCell(item: item)
                            }
                        }
                    }
                }
            }
            .navigationTitle("SCBook")
        }
    }
    
    var background: some View {
        AngularGradient(
            gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.9541666507720947, green: 0.6599652767181396, blue: 0.6599652767181396, alpha: 1)), location: 0.14326532185077667),
                .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), location: 0.4985717535018921),
                .init(color: Color(#colorLiteral(red: 0.9541666507720947, green: 0.6599652767181396, blue: 0.6599652767181396, alpha: 1)), location: 0.8701561689376831),
                .init(color: Color(#colorLiteral(red: 0.9041666388511658, green: 0.4596180319786072, blue: 0.4596180319786072, alpha: 1)), location: 0.9971840381622314)]),
            center: UnitPoint(x: 0.4999999056591794, y: 0.5000000405261534),
            angle: .init(degrees: 45)
        )
        .ignoresSafeArea()
    }
}

struct ListCell: View {
    
    var item: ListModel
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 8) {
                
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color(#colorLiteral(red: 0.5529412031173706, green: 0.1725490242242813, blue: 0.7882353067398071, alpha: 1)), location: 0),
                        .init(color: Color(#colorLiteral(red: 0.3176470696926117, green: 0.24705882370471954, blue: 0.7764706015586853, alpha: 1)), location: 0.4895833432674408),
                        .init(color: Color(#colorLiteral(red: 0.08235294371843338, green: 0.019607843831181526, blue: 0.18431372940540314, alpha: 1)), location: 1)]),
                    startPoint: UnitPoint(x: -1.557021853115792e-8, y: 0.3515624736324306),
                    endPoint: UnitPoint(x: 1.0000000119047296, y: 0.6321022780204675))
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
                .stroke(LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)), location: 0),
                        .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)), location: 1)]),
                    startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                    endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)), lineWidth: 1)
                .blendMode(.overlay)
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
    }
}
