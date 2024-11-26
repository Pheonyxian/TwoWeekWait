//
//  FadeInTextView.swift
//  TwoWeekWait
//
//  Created by Darby Vernon on 11/21/24.
//
import SwiftUI

struct FadeInTextView: View {
    var text: String
    var textColor: Color = .white
    
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .frame(alignment: .leading)
                .foregroundColor(textColor)
                .padding([.bottom], 20)
                .opacity(text.isEmpty ? 0 : 1) // Hide when empty
                .animation(.easeInOut(duration: 1), value: text) // Smooth fade effect
            Spacer()
        }
    }
}
