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

struct WindowDemo: View {

    @Environment(\.openWindow) private var openWindow

    var body: some View {
        VStack {
            Form {
                Section {
                    Button("Open Window") {
                        openWindow(id: "Window Demo")
                    }
                    Button("Open TitleBar Window") {
                        openWindow(id: "TitleBar Window Demo")
                    }
                    Button("Open HiddenTitleBar Window") {
                        openWindow(id: "HiddenTitleBar Window Demo")
                    }
                }

                Section {
                    Button("Open DefaultSize Window") {
                        openWindow(id: "DefaultSize Window Demo")
                    }
                    Button("Open ContentSize Window") {
                        openWindow(id: "ContentSize Window Demo")
                    }
                    Button("Open ContentMinSize Window") {
                        openWindow(id: "ContentMinSize Window Demo")
                    }
                }

                Section {
                    Button("Open BottomTrailing Window") {
                        openWindow(id: "BottomTrailing Window Demo")
                    }
                }

                Section {
                    HStack {
                        Button("Reset Window Frames") {
                            resetWindowFrames()
                        }
                        Spacer()
                        Text("Restart after click")
                    }
                }
            }
            .formStyle(.grouped)
        }
    }

    func resetWindowFrames() {
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            if key.starts(with: "NSWindow Frame") {
                UserDefaults.standard.removeObject(forKey: key)
            }
        }
        print("Restart App")
    }

}

