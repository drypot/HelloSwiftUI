//
//  ForEachDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/17/24.
//

import SwiftUI

// ForEach allows you to iterate over collections or ranges to create multiple views dynamically.

struct ForEachDemo: View {

    let fruits = ["Apple", "Banana", "Orange"]

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
        HStack(alignment: .top, spacing: 15) {
            VStack(alignment: .leading) {
                ForEach(fruits, id: \.self) { fruit in
                    Text(fruit)
                }
            }
            VStack(alignment: .leading, spacing: 10) {
                ForEach(0..<5) { index in
                    Text("Index: \(index)")
                }
            }
            VStack(alignment: .leading, spacing: 15) {
                ForEach(items) { item in
                    Text(item.name)
                }
            }

        }
        .padding()
    }
}

#Preview {
    ForEachDemo()
}
