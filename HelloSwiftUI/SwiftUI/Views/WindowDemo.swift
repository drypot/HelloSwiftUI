//
//  WindowDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/21/24.
//

import SwiftUI

struct WindowDemo: View {

    @Environment(\.openWindow) private var openWindow
//    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
        Button("Open WindowGroup") {
            openWindow(id: "WindowGroup Demo")
        }
        Button("Open Window") {
            openWindow(id: "Window Demo")
        }
    }
}

#Preview {
    WindowDemo()
}
