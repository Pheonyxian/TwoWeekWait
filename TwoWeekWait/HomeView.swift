//
//  HomeView.swift
//  TwoWeekWait
//
//  Created by Darby Vernon on 11/17/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @Binding var viewState: ViewState
    
    var body: some View {
        VStack {
            Button {
                justWaitingTapped()
            } label: {
                Text("Just Waiting")
                    .font(.system(size: 36, weight: .heavy, design: .rounded))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 2)
                    )
            }
            .buttonStyle(HomeButtonStyle(backgroundColor: Color.init(hex: "#f48fb1")))
            .padding([.bottom], 12)
            
            HStack {
                Button {
                    positiveButtonTapped()
                } label: {
                    Text("Positive Line!")
                        .font(.system(size: 24, weight: .regular, design: .rounded))
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 2)
                        )
                }
                .buttonStyle(HomeButtonStyle(backgroundColor: Color.init(hex: "00d1d4")))
                Button {
                    negativeButtonTapped()
                } label: {
                    Text("No Line...")
                        .font(.system(size: 24, weight: .regular, design: .rounded))
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 2)
                        )
                }
                .buttonStyle(HomeButtonStyle(backgroundColor: .gray))
            }
        }
        .padding()
        .background(Color.init(hex: "#fad2e0"))
    }
    
    func justWaitingTapped() {
        viewState = .waiting
    }
    
    func positiveButtonTapped() {
        viewState = .positive
    }
    
    func negativeButtonTapped() {
        viewState = .negative
    }
}

struct HomeButtonStyle: ButtonStyle {
    var backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(10)
            //.scaleEffect(configuration.isPressed ? 0.95 : 1.0) // Adds a slight shrink effect when pressed
            //.animation(.easeInOut(duration: 0.2), value: configuration.isPressed) // Smooth animation
    }
}

#Preview {
    @Previewable @State var viewState: ViewState = .home
    HomeView(viewState: $viewState)
}
