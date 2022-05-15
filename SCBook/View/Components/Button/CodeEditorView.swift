//
//  CodeEditorView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/05/15.
//

import SwiftUI
import CodeEditorView

struct CodeEditorView: View {
    
    @State private var text: String = """

import SwiftUI

struct BasicButtons: View {
    var body: some View {
        ZStack {
            
            Color.offWhite
                .ignoresSafeArea()
            
            ScrollView {
                
                Spacer().frame(height: 50)
                
                VStack(alignment: .leading) {
                    Text("System Button Style")
                        .font(.body.bold())
                        .foregroundColor(.black)
                    HStack {
                        ButtonLabel(title: "plain") {
                            Label("Play", systemImage: "play.fill")
                        }
                        .buttonStyle(.plain)
                    
                        ButtonLabel(title: "borderless") {
                            Label("Play", systemImage: "play.fill")
                        }
                        .buttonStyle(.borderless)
                    }
                    
                    HStack {
                        ButtonLabel(title: "bordered") {
                            Label("Play", systemImage: "play.fill")
                        }
                        .buttonStyle(.bordered)
                        ButtonLabel(title: "prominent") {
                            Label("Play", systemImage: "play.fill")
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                
                Divider()
                    .padding()
                
                VStack(alignment: .leading) {
                    Text("Button Border Shape")
                        .font(.body.bold())
                        .foregroundColor(.black)

                    HStack {
                        ButtonLabel(title: "circle") {
                            Label("Play", systemImage: "play.fill")
                                .padding()
                                .background(
                                    Circle()
                                        .fill(.yellow)
                                        .frame(width: 70, height: 70)
                                )
                        }
                        .buttonStyle(.plain)
                        
                        ButtonLabel(title: "capsule") {
                            Label("Play", systemImage: "play.fill")
                                .padding()
                                .background(
                                    Capsule()
                                        .fill(.red)
                                        .frame(width: 100, height: 40)
                                )
                        }
                        .buttonStyle(.plain)
                    }
                    
                    HStack {
                        ButtonLabel(title: "ellipse") {
                            Label("Play", systemImage: "play.fill")
                                .padding()
                                .background(
                                    Ellipse()
                                        .fill(.green)
                                        .frame(width: 100, height: 40)
                                )
                        }
                        .buttonStyle(.plain)
                        ButtonLabel(title: "cornerSize") {
                            Label("Play", systemImage: "play.fill")
                                .padding()
                                .background(
                                    RoundedRectangle(cornerSize: CGSize(width: 10, height: 20))
                                        .fill(.purple)
                                        .frame(width: 100, height: 40)
                                )
                        }
                        .buttonStyle(.plain)
                    }
                }
                
                Divider()
                    .padding()
                
                VStack(alignment: .leading) {
                    Text("Shadow & Blur Style")
                        .font(.body.bold())
                        .foregroundColor(.black)

                    HStack {
                        ButtonLabel(title: "radius: 1") {
                            Label("Play", systemImage: "play.fill")
                                .padding()
                                .background(
                                    Circle()
                                        .fill(.yellow)
                                        .frame(width: 70, height: 70)
                                        .shadow(color: .black.opacity(1), radius: 1, x: 3, y: 2)
                                )
                        }
                        .buttonStyle(.plain)
                        
                        ButtonLabel(title: "radius: 3") {
                            Label("Play", systemImage: "play.fill")
                                .padding()
                                .background(
                                    Capsule()
                                        .fill(.red)
                                        .frame(width: 100, height: 40)
                                        .shadow(color: .black.opacity(1), radius: 3, x: 3, y: 2)
                                )
                        }
                        .buttonStyle(.plain)
                    }
                    
                    HStack {
                        ButtonLabel(title: "blur: 1") {
                            Label("Play", systemImage: "play.fill")
                                .padding()
                                .background(
                                    Ellipse()
                                        .fill(.green)
                                        .frame(width: 100, height: 40)
                                        .blur(radius: 1)
                                )
                        }
                        .buttonStyle(.plain)
                        ButtonLabel(title: "blur: 3") {
                            Label("Play", systemImage: "play.fill")
                                .padding()
                                .background(
                                    RoundedRectangle(cornerSize: CGSize(width: 10, height: 20))
                                        .fill(.purple)
                                        .frame(width: 100, height: 40)
                                        .blur(radius: 3)
                                )
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        .navigationTitle("Basic")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BasicButtons_Previews: PreviewProvider {
    static var previews: some View {
        BasicButtons()
    }
}

//Action넣기귀찮으니.
struct ButtonLabel<Content>: View where Content: View {
    
    let width = UIScreen.main.bounds.width
    let title: String
    
    let content: () -> Content
    
    init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.title = title
    }
    var body: some View {
        GeometryReader { geometry in
            Button { print() } label: {
                ZStack {
                    content()
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                    Text(title)
                        .foregroundColor(.gray)
                        .offset(
                            x: 0,
                            y: ((geometry.size.width - 10) / 3))
                }
            }
            .frame(width: geometry.size.width - 10, //그 고정범위안에서 놀기.
                   height: geometry.size.height - 10) //고정값부여
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color.offWhite)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: .white.opacity(0.7), radius: 10, x: -5, y: -5)
            )
            .frame(maxWidth: .infinity) //화면 공간 최대로 골고루 차지하도록.
        }
        .frame(width: width / 2 - 20, height: width / 2 - 20) //고정 범위. geometry의 높이가된다.
    }
}
"""
    @State private var messages: Set<Located<Message>> = Set()
    
    @SceneStorage("editPosition") private var editPosition: CodeEditor.Position = CodeEditor.Position()
    
    var body: some View {
        CodeEditor(text: $text, position: $editPosition, messages: $messages, language: .swift, layout: .standard)
    }
}

struct CodeEditorView_Previews: PreviewProvider {
    static var previews: some View {
        CodeEditorView()
    }
}
