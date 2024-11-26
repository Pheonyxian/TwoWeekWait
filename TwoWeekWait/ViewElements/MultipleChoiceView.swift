//
//  MultipleChoiceView.swift
//  TwoWeekWait
//
//  Created by Darby Vernon on 11/21/24.
//

import SwiftUI

struct MultipleChoiceView: View {
    var choices: [Choice]
    
    var body: some View {
        HStack {
            ForEach(choices) { choice in
                Button {
                    choice.onSelected()
                } label: {
                    Text(choice.text)
                }
            }
            Spacer()
        }
    }
}

struct Choice: Identifiable {
    var id: UUID = .init()
    
    let text: String
    let onSelected: () -> ()
}
