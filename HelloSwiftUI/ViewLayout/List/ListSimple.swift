//
//  ListSimple.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/14/24.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/list

struct ListSimple: View {
    var body: some View {
        List {
            Text("first")
            Text("second")
            Text("third")
        }
    }
}
