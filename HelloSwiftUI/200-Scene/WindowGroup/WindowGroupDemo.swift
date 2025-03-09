//
//  WindowDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/12/24.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/windows
// https://developer.apple.com/documentation/swiftui/windowgroup
// https://developer.apple.com/documentation/visionos/presenting-windows-and-spaces
// https://developer.apple.com/documentation/visionos/positioning-and-sizing-windows
// https://developer.apple.com/design/human-interface-guidelines/windows

struct WindowGroupDemo: View {

    @Environment(\.openWindow) private var openWindow

    var body: some View {
        VStack {
            Form {
                Section {
                    Button("Open WindowGroup") {
                        openWindow(id: "WindowGroup Demo")
                    }
                }

                Section {
                    Button("Open Message1") {
                        openWindow(id: "Message Demo", value: SimpleMessage.messages[0].id)
                    }
                    Button("Open Message2") {
                        openWindow(id: "Message Demo", value: SimpleMessage.messages[1].id)
                    }
                    Button("Open Message3") {
                        openWindow(id: "Message Demo", value: SimpleMessage.messages[2].id)
                    }
                }
            }
            .formStyle(.grouped)
        }
    }

}

