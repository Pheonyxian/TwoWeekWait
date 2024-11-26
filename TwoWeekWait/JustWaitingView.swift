//
//  JustWaitingView.swift
//  TwoWeekWait
//
//  Created by Darby Vernon on 11/17/24.
//

import SwiftUI

struct JustWaitingView: View {
    @StateObject var viewModel = JustWaitingViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                VStack(alignment: .leading) {
                    //God forbid the alignment actually work and I didn't have to do this
                    Spacer()
                    //FadeInTextView(text: $viewModel.text1)
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            ZStack {
                VStack(alignment: .leading) {
                    //FadeInTextView(text: $viewModel.text2)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
           
        }
        .padding([.leading, .trailing], 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.init(hex: "#fad2e0"))
    }
}

#Preview {
    JustWaitingView()
}
