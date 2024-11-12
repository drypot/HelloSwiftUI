//
//  NavigationSplitViewDemoLauncher.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/12/24.
//

import SwiftUI

struct NavigationSplitViewDemoLauncher: View {

    @Environment(\.openWindow) private var openWindow

    var body: some View {
        VStack {
            Button("Open NavigationSplitView Demo") {
                openWindow(id: "NavigationSplitView Demo")
            }
            Button("Open NavigationSplitView Demo 2") {
                openWindow(id: "NavigationSplitView Demo 2")
            }
            Button("Open NavigationSplitView Demo 3") {
                openWindow(id: "NavigationSplitView Demo 3")
            }
        }
    }
}

