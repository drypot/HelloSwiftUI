//
//  ListSimple.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/14/24.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/list

struct ListSimple: View {

    @State var selection: Int = 0

    var body: some View {
        List(selection: $selection) {
            Text("Item 1").tag(0)
            Text("Item 2").tag(1)
            Text("Item 3").tag(2)
        }
        .onChange(of: selection) { oldValue, newValue in
            print(newValue)
        }
    }
}
