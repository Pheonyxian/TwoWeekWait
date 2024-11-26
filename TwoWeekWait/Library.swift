//
//  Library.swift
//  TwoWeekWait
//
//  Created by Darby Vernon on 11/17/24.
//

import SwiftUI

struct WaitingLibrary {
    lazy var library = [day1Library, day2Library]
    
    let day1Library = [
        "Here's what your ovaries are doing right now:",
        "Sleeping in, like me",
        "😪"
    ]
    
    let day2Library = [
        "Two weeks can seem like a long time to wait",
        "especially if it's not your first time trying",
        "but one day you'll look back at this time and be grateful",
        "for those eight hours of sleep you're getting.",
        "Until then, take a minute to do something nice for yourself.",
        "Brew some coffee, or tea, or fuck it, brew a milkshake."
    ]
}

struct TestLibrary {
    lazy var library = [test]
    
    let test: [Any] = [
        "Here is a test",
        Image(.theEmperor)
    ]
}

enum LibraryType: String {
    case waiting, positive, negative
}
