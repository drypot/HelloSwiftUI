//
//  NavigationSplitDemoLauncher.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 2/5/26.
//

import SwiftUI

struct NavigationSplitDemoLauncher: View {

    @Environment(\.openWindow) private var openWindow

    var body: some View {
        VStack {
            Button("NavigationSplit by ID Demo") {
                openWindow(id: "NavigationSplit by ID Demo")
            }
            Button("NavigationSplit by Value Demo") {
                openWindow(id: "NavigationSplit by Value Demo")
            }
            Button("NavigationSplit by Block Demo") {
                openWindow(id: "NavigationSplit by Block Demo")
            }
            Button("NavigationSplit by AnyTypeID Demo") {
                openWindow(id: "NavigationSplit by AnyTypeID Demo")
            }
            Button("NavigationSplit by AnyTypeValue Demo") {
                openWindow(id: "NavigationSplit by AnyTypeValue Demo")
            }
        }
    }
}

