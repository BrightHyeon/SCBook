//
//  LoopingPlayer.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/28.
//
//MARK: 이해를 포기
//나중에 어차피 할 과정이니
//이번 시간은 LO에 집중하자.

import SwiftUI
import AVKit

//오 이렇게하면 View처럼 쓰이게됨.
struct LoopingPlayer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        return PlayerUIView(frame: .zero) //why zero?
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //Do nothing here.
    }
}

class PlayerUIView: UIView {
    
    private var playerLayer = AVPlayerLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //Load Video - file찾고, file url을 아이템으로 등록.
        let file = Bundle.main.url(forResource: "MoonSky", withExtension: "mp4")!
        let item = AVPlayerItem(url: file)
        
        //Setup Player - 아이템을 플레이어아이템으로 넣기.
        let player = AVPlayer(playerItem: item)
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        
        //# Loop
        player.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(self, selector: #selector(rewindVideo(notification:)), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        //Play
        player.play()
        
    }
    
    @objc
    func rewindVideo(notification: Notification) {
        playerLayer.player?.seek(to: .zero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct LoopingPlayer_Previews: PreviewProvider {
    static var previews: some View {
        LoopingPlayer()
    }
}

//#표시한 곳부터가 looping을 위한 코드.
