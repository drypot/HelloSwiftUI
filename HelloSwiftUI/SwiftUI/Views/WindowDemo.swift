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
        Button("Open WindowGroup Scene") {
            openWindow(id: "WindowGroup Demo")
        }
        Button("Open Window Scene") {
            openWindow(id: "Window Demo")
        }
    }
}

#Preview {
    WindowDemo()
}
