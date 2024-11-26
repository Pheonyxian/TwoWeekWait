//
//  DoublePresenterView.swift
//  TwoWeekWait
//
//  Created by Darby Vernon on 11/24/24.
//

import SwiftUI

struct DoublePresenterView: View {
    @StateObject var viewModel = DoublePresenterViewModel(libraryType: .waiting)
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                // First container
                ContainerView(backgroundColor: .green, position: .top, height: geometry.size.height, viewModel: viewModel)
                    .frame(height: geometry.size.height / 2)
                
                // Second container
                ContainerView(backgroundColor: .blue, position: .bottom, height: geometry.size.height, viewModel: viewModel)
                    .frame(height: geometry.size.height / 2)
            }
            .padding([.leading, .trailing], 20)
        }
        .background(Color.init(hex: "#fad2e0"))
    }
}

struct ContainerView: View {
    var backgroundColor: Color = .clear
    var position: PresenterViewPosition
    var height: CGFloat
    @ObservedObject var viewModel: DoublePresenterViewModel
    var element: Any {
        get { position == .top ? viewModel.topPresenterElement : viewModel.bottomPresenterElement }
    }
    
    var body: some View {
        ZStack {
            backgroundColor
            VStack {
                if position == .top {
                    Spacer()
                }
                switch element {
                case let text as String:
                    FadeInTextView(text: text)
                case let image as Image:
                    FadeInImageView(image: image)
                        .frame(height: height/6)
                default:
                    EmptyView()
                }
                if position == .bottom {
                    Spacer()
                }
            }
        }
    }
}

enum PresenterViewPosition {
    case top, bottom
}

#Preview {
    DoublePresenterView()
}
