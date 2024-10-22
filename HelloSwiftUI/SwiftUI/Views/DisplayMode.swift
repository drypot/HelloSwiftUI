//
//  DisplayMode.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/22/24.
//

import SwiftUI

enum DisplayMode: String, CaseIterable {
    case light = "Light"
    case dark = "Dark"
    case auto = "Auto"

    static func changeDisplayMode(to mode: DisplayMode) {
        @AppStorage("displayMode") var displayMode = DisplayMode.auto

        displayMode = mode

        switch mode {
        case .light:
            NSApp.appearance = NSAppearance(named: .aqua)
        case .dark:
            NSApp.appearance = NSAppearance(named: .darkAqua)
        case .auto:
            NSApp.appearance = nil
        }
    }
}

struct DisplayModePicker: View {

    @AppStorage("displayMode") var displayMode = DisplayMode.auto

    var body: some View {
        Picker("Appearance", selection: $displayMode) {
            ForEach(DisplayMode.allCases, id: \.self) {
                Text($0.rawValue)
                    .tag($0)
            }
        }
    }

}
