//
//  Video.swift
//  SnapchatDiscovery
//
//  Created by shashank on 16/01/21.
//

import SwiftUI
import AVKit

struct Video: Identifiable {
    var id = UUID().uuidString
    var player: AVPlayer
}

extension Video {
    init(url: URL) {
        let item = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: item)
    }
}

func getBundleUrl(fileName: String) -> URL {
    let bundle = Bundle.main.path(forResource: fileName, ofType: "mp4")
    return URL(fileURLWithPath: bundle!)
}

var videos = [
    Video(url: getBundleUrl(fileName: "1")),
//    Video(url: "https://www.youtube.com/watch?v=0P_S-N0XS0k"),
//    Video(url: "https://www.youtube.com/watch?v=YhTG00uyCnM"),
//    Video(url: "https://www.youtube.com/watch?v=YhTG00uyCnM"),
//    Video(url: "https://www.youtube.com/watch?v=YhTG00uyCnM"),
//    Video(url: "https://www.youtube.com/watch?v=YhTG00uyCnM"),
//    Video(url: "https://www.youtube.com/watch?v=YhTG00uyCnM")
]






struct PortfolioImage: Identifiable {
    var id = UUID().uuidString
    var imageName: String
}

var portfolioImages = [

    PortfolioImage(imageName: "image1"),
    PortfolioImage(imageName: "image2"),
    PortfolioImage(imageName: "image3"),
    PortfolioImage(imageName: "image4"),
    PortfolioImage(imageName: "image5"),
    PortfolioImage(imageName: "image6"),
    PortfolioImage(imageName: "image7"),
    PortfolioImage(imageName: "image8"),
    PortfolioImage(imageName: "image9")

]
