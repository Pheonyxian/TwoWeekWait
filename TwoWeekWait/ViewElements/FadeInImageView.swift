//
//  FadeInImageView.swift
//  TwoWeekWait
//
//  Created by Darby Vernon on 11/26/24.
//

import SwiftUI

struct FadeInImageView: View {
    @State private var isVisible: Bool = false
    var image: Image
    
    var body: some View {
        HStack {
            image
                .aspectRatio(contentMode: .fit)
                .padding([.bottom], 20)
                .opacity(isVisible ? 1 : 0) // Set opacity based on state
                .animation(.easeInOut(duration: 1), value: isVisible) // Animate opacity change
                    .onAppear {
                        isVisible = true // Trigger fade-in when view appears
                    }
        }
    }
}
