//
//  DoublePresenterViewModel.swift
//  TwoWeekWait
//
//  Created by Darby Vernon on 11/24/24.
//

import SwiftUI

class DoublePresenterViewModel: ObservableObject {
    @Published var topPresenterElement: Any = ""
    @Published var bottomPresenterElement: Any = ""
    
    let libraryType: LibraryType
    var library: [Any] = []
    
    init(libraryType: LibraryType) {
        self.libraryType = libraryType
        getTextLibrary()
        populateDisplay()
    }
    
    func getTextLibrary() {
        let defaults = UserDefaults.standard
        var library = TestLibrary()
        if let day = defaults.integer(forKey: libraryType.rawValue + Keys.DayKey) as Int? {
            guard day < library.library.count else { return }
            //textLibrary = library.library[day]
            self.library = library.library[0]
        }
        else {
            self.library = ["Uh oh, a problem occured", "Go bug Darby to fix it."]
        }
    }
    
    func populateDisplay() {
        //Creates an effect where it the first line is filled in, then the second, then pauses before clearing both and running again.
        Task {
            for (index, element) in library.enumerated() {
                if index % 2 == 0 {
                    DispatchQueue.main.async { [weak self] in
                        self?.topPresenterElement = element
                    }
                    try await Task.sleep(for: .seconds(1))
                }
                else {
                    DispatchQueue.main.async { [weak self] in
                        self?.bottomPresenterElement = element
                    }
                    try await Task.sleep(for: .seconds(3))
                    
                    //Keep the text on screen if it's the last one.
                    if index != library.count - 1 {
                        DispatchQueue.main.async { [weak self] in
                            self?.topPresenterElement = ""
                            self?.bottomPresenterElement = ""
                        }
                        try await Task.sleep(for: .seconds(1))
                    }
                }
            }
        }
    }
    
    
}

enum DisplayType {
    case text
    case image
    case choice
}
