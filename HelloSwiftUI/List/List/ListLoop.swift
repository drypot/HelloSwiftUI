//
//  ListLoop.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/14/24.
//

import SwiftUI

struct ListLoop: View {

    struct Item: Identifiable, Hashable, IDHashable {
        let id = UUID()
        let name: String
    }

    let items = [
        Item(name: "Item 1"),
        Item(name: "Item 2"),
        Item(name: "Item 3")
    ]

    let item4 = Item(name: "Item 4")

    @State private var selection = Set<Item>()

    var body: some View {
        HStack {
            List(items, id: \.self, selection: $selection) { item in
                Text(item.name)
            }
            
            List(selection: $selection) {
                ForEach(items, id: \.self) { item in
                    Text(item.name)
                }
                Text(item4.name).tag(item4)
            }
            
            List(Array(selection)) { item in
                Text(item.name)
            }
        }
    }
}
