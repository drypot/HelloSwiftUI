//
//  SettingsView.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/19/24.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/settings

struct SettingsView: View {

    @AppStorage("showPreview") var showPreview = true
    @AppStorage("fontSize") var fontSize = 12.0

    var body: some View {
        TabView {
            Tab("General", systemImage: "gear") {
                Form {
                    Toggle("Show Previews", isOn: $showPreview)
                    Slider(value: $fontSize, in: 9...96) {
                        Text("Font Size (\(fontSize, specifier: "%.0f") pts)")
                    }
                }
            }
            Tab("Advanced", systemImage: "star") {
                Text("AdvancedSettingsView")
            }
        }
        .scenePadding()
        .frame(maxWidth: 350, minHeight: 100)
    }
}

#Preview {
    SettingsView()
}
