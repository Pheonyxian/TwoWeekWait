//
//  RootView.swift
//  TwoWeekWait
//
//  Created by Darby Vernon on 11/17/24.
//

import SwiftUI

struct RootView: View {
    @StateObject var viewModel = RootViewModel()
    
    var body: some View {
        switch viewModel.state {
        case .home:
            HomeView(viewState: $viewModel.state)
        case .intro:
            ContentView()
        case .positive:
            ContentView()
        case .negative:
            ContentView()
        case .waiting:
            DoublePresenterView()
        }
    }
}

#Preview {
    RootView()
}
