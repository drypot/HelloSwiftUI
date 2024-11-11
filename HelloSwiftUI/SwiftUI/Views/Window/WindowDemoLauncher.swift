//
//  WindowDemoLauncher.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/12/24.
//

import SwiftUI

struct WindowDemoLauncher: View {

    @Environment(\.openWindow) private var openWindow

    var body: some View {
        VStack {
            Button("Open WindowGroup Scene") {
                openWindow(id: "WindowGroup Demo")
            }
            Button("Open Window Scene") {
                openWindow(id: "Window Demo")
            }
        }
    }
}

