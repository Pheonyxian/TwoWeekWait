//
//  RootViewModel.swift
//  TwoWeekWait
//
//  Created by Darby Vernon on 11/17/24.
//

import SwiftUI

class RootViewModel: ObservableObject {
    @Published var state: ViewState = .home
    
}

enum ViewState {
    case home
    case waiting
    case positive
    case negative
    case intro
}

