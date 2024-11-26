//
//  FadeInTextField.swift
//  TwoWeekWait
//
//  Created by Darby Vernon on 11/21/24.
//
import SwiftUI

struct FadeInTextField: View {
    var title: String = ""
    var textColor: Color = .white
    var titleFont: Font = .system(size: 24, weight: .bold, design: .rounded)
    @Binding var text: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(titleFont)
                .frame(alignment: .leading)
                .foregroundColor(textColor)
                .padding([.bottom], 8)
                .opacity(title.isEmpty ? 0 : 1) // Hide when empty
                .animation(.easeInOut(duration: 1), value: title) // Smooth fade effect
            
            TextField("", text: $text)
                .modifier(customTextFieldViewModifier(roundedCornes: 6, startColor: .white, endColor: Color(hex: "#FFD1DC"), textColor: Color(hex: "#A94064")))
        }
    }
}

struct customTextFieldViewModifier: ViewModifier {
    var roundedCornes: CGFloat
    var startColor: Color
    var endColor: Color
    var textColor: Color

    func body(content: Content) -> some View {
        content
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundedCornes)
            .padding(3)
            .foregroundColor(textColor)
            .overlay(RoundedRectangle(cornerRadius: roundedCornes)
                        .stroke(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5))
            .font(.custom("Open Sans", size: 18))

            .shadow(radius: 10)
    }
}
