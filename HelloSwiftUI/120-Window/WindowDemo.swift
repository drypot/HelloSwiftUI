//
//  WindowDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/12/24.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/windows
// https://developer.apple.com/documentation/swiftui/windowgroup
// https://developer.apple.com/design/human-interface-guidelines/windows

struct WindowDemo: View {

    @Environment(\.openWindow) private var openWindow

    var body: some View {
        VStack {
            Form {
                Button("Open WindowGroup") {
                    openWindow(id: "WindowGroup Demo")
                }
                Button("Open Message1") {
                    openWindow(id: "Message Demo", value: SimpleMessage.messages[0].id)
                }
                Button("Open Message2") {
                    openWindow(id: "Message Demo", value: SimpleMessage.messages[1].id)
                }
                Button("Open Message3") {
                    openWindow(id: "Message Demo", value: SimpleMessage.messages[2].id)
                }
                Button("Open Window") {
                    openWindow(id: "Window Demo")
                }
                Button("Open Utility Window") {
                    //openWindow(id: "Window Demo") 나중에 만들자.
                }
                .disabled(true)
            }
            .formStyle(.grouped)
        }
    }
}

