//
//  Home.swift
//  SnapchatDiscovery
//
//  Created by shashank on 16/01/21.
//

import SwiftUI

struct Home: View {
    
    //    var colums = [
    //        GridItem(.flexible()),
    //        GridItem(.flexible())
    //    ]
    @StateObject var viewModel = HomeViewModel()
    var colums = Array(repeating: GridItem(.fixed((UIScreen.main.bounds.width - 8) / 2), spacing: 8), count: 2)
    
    @Namespace var animation
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    Image(systemName: "line.horizontal.3")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                    
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                }
                .padding()
                .overlay(
                    Text("Discover")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                )
                .padding(.horizontal)
                ScrollView {
                    LazyVGrid(columns: colums, content: {
                        ForEach(portfolioImages) { image in
                            PortfolioImageView(imageName: image.imageName)
                                .frame(width: (UIScreen.main.bounds.width - 16) / 2 ,height: 280)
                                .aspectRatio(contentMode: .fill)
                                .scaleEffect( viewModel.isScalled && viewModel.selectedImage.id == image.id ? viewModel.scale : 1)
                                .matchedGeometryEffect(id: image.id, in: animation)
                                .cornerRadius(10)
                                .onTapGesture {
                                    
                                    withAnimation {
                                        self.viewModel.selectedImage = image
                                        self.viewModel.isScalled = true
                                    }
                                }
                                .zIndex(0)
                        }
                        
                    }
                    )
                    .padding()
                }
            }
            if viewModel.isScalled {
                PortfolioImageView(imageName: viewModel.selectedImage.imageName)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(10)
                    .matchedGeometryEffect(id: viewModel.selectedImage.id, in: animation)
                    .offset(viewModel.offset)
                    .scaleEffect(viewModel.scale)
                    .gesture(DragGesture().onChanged(onChange(value:)).onEnded(onEnd(value:)))
                    .ignoresSafeArea(.all)
                    .zIndex(3)
            }
        }
    }
    
    func onChange(value: DragGesture.Value) {
        if value.translation.height > 0 {
            self.viewModel.offset = value.translation
            let progress = value.translation.height / (UIScreen.main.bounds.height - 50)
            if 1 - progress > 0.5 {
                viewModel.scale = 1 - progress
            }
        }
    }
    
    func onEnd(value: DragGesture.Value) {
        withAnimation(.default) {
            if value.translation.height > 300 {
                self.viewModel.isScalled = false
            }
            viewModel.scale = 1
            self.viewModel.offset = .zero
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
