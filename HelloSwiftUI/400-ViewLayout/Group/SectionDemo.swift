//
//  SectionDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/24/24.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/section

struct SectionDemo: View {

    @State var isExpanded = true

    var body: some View {
        HStack {
            List {
                Section {
                    Text("Item 1")
                    Text("Item 2")
                    Text("Item 3")
                } header: {
                    Text("Header")
                } footer: {
                    Text("Footer")
                }
            }

            List {
                Section(isExpanded: $isExpanded) {
                    Text("Item 1")
                    Text("Item 2")
                    Text("Item 3")
                } header: {
                    Text("Header")
                }
            }
        }
    }
}

#Preview {
    SectionDemo()
}
