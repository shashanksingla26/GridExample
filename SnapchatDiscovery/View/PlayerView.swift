//
//  PlayerView.swift
//  SnapchatDiscovery
//
//  Created by shashank on 16/01/21.
//

import SwiftUI
import AVKit

//struct PlayerView: UIViewControllerRepresentable {
//
//    var player: AVPlayer
//
//    func makeUIViewController(context: Context) -> AVPlayerViewController {
//        let vc = AVPlayerViewController()
//        vc.player = player
//        vc.videoGravity = .resizeAspectFill
//        vc.showsPlaybackControls = false
//        return vc
//    }
//
//    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
//
//    }
//
//}


struct PortfolioImageView: View {
    var imageName: String
    var body: some View {
       Image(imageName)
        .resizable()
       
    }
}


struct PortfolioImageView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
