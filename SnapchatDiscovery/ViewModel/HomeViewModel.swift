//
//  HomeViewModel.swift
//  SnapchatDiscovery
//
//  Created by shashank on 16/01/21.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var isScalled: Bool  = false
    @Published var offset: CGSize =  .zero
    @Published var scale: CGFloat = 1
    var selectedImage: PortfolioImage = PortfolioImage(imageName: "")
}
