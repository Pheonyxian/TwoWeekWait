//
//  JustWaitingViewModel.swift
//  TwoWeekWait
//
//  Created by Darby Vernon on 11/17/24.
//

import SwiftUI

class JustWaitingViewModel: ObservableObject {
    @Published var text1: String = ""
    @Published var text2: String = ""
    
    lazy var textLibrary: [String] = []
    
    init() {
        getTextLibrary()
        displayText()
    }
    
    func getTextLibrary() {
        let defaults = UserDefaults.standard
        var library = WaitingLibrary()
        if let day = defaults.integer(forKey: Keys.DayKey) as Int? {
            guard day < library.library.count else { return }
            //textLibrary = library.library[day]
            textLibrary = library.library[1]
        }
        else {
            textLibrary = ["Uh oh, a problem occured", "Go bug Darby to fix it."]
        }
    }
    
    func displayText() {
        //Creates an effect where it the first line is filled in, then the second, then pauses before clearing both and running again.
        Task {
            for (index, text) in textLibrary.enumerated() {
                if index % 2 == 0 {
                    DispatchQueue.main.async { [weak self] in
                        self?.text1 = text
                    }
                    try await Task.sleep(for: .seconds(1))
                }
                else {
                    DispatchQueue.main.async { [weak self] in
                        self?.text2 = text
                    }
                    try await Task.sleep(for: .seconds(3))
                    
                    //Keep the text on screen if it's the last one.
                    if index != textLibrary.count - 1 {
                        DispatchQueue.main.async { [weak self] in
                            self?.text1 = ""
                            self?.text2 = ""
                        }
                        try await Task.sleep(for: .seconds(1))
                    }
                }
            }
        }
    }
}
