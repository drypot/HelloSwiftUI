//
//  SectionDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/24/24.
//

import SwiftUI

struct SectionDemo: View {
    var body: some View {
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
    }
}

#Preview {
    SectionDemo()
}
