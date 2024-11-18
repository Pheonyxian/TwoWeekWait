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
                    HStack {
                        Text(viewModel.text1)
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .frame(alignment: .leading)
                            .foregroundColor(.white)
                            .padding([.bottom], 20)
                            .opacity(viewModel.text1.isEmpty ? 0 : 1) // Hide when empty
                            .animation(.easeInOut(duration: 1), value: viewModel.text1) // Smooth fade effect
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            ZStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text(viewModel.text2)
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .frame(alignment: .leading)
                            .foregroundColor(.white)
                            .opacity(viewModel.text2.isEmpty ? 0 : 1) // Hide when empty
                            .animation(.easeInOut(duration: 1), value: viewModel.text2) // Smooth fade effect
                        Spacer()
                    }
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
