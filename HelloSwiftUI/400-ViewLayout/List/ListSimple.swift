//
//  ListSimple.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/14/24.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/list

struct ListSimple: View {

    struct Item: Identifiable {
        let id = UUID()
        let name: String
    }

    let items = [
        Item(name: "Item 1"),
        Item(name: "Item 2"),
        Item(name: "Item 3")
    ]

    var body: some View {
        List {
            ForEach(items) { item in
                Text(item.name)
            }
        }
    }
}
