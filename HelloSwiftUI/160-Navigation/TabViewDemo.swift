//
//  TabViewDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/24/24.
//

import SwiftUI

struct TabViewDemo: View {

    @State var selection = 0

    var body: some View {
        TabView(selection: $selection) {
            Tab("Received", systemImage: "tray.and.arrow.down.fill", value: 0) {
                Spacer()
            }
            Tab("Sent", systemImage: "tray.and.arrow.up.fill", value: 1) {
                Spacer()
            }
            Tab("Account", systemImage: "person.crop.circle.fill", value: 2) {
                Spacer()
            }
        }
        .scenePadding()
        .onChange(of: selection) { oldValue, newValue in
            print("selection: \(newValue)")
        }
    }

}

#Preview {
    TabViewDemo()
}
