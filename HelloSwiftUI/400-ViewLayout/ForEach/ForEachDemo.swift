//
//  ForEachDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/17/24.
//

import SwiftUI

// ForEach allows you to iterate over collections or ranges to create multiple views dynamically.

struct ForEachDemo: View {

    struct Item: Identifiable {
        let id = UUID()
        let name: String
    }

    let items = [
        Item(name: "Item 1"),
        Item(name: "Item 2"),
        Item(name: "Item 3")
    ]

    let fruits = ["Apple", "Banana", "Orange"]

    var body: some View {
        HStack {

            List {
                ForEach(items) { item in
                    Text(item.name)
                }
            }

            List {
                ForEach(fruits, id: \.self) { fruit in
                    Text(fruit)
                }
            }

            List {
                ForEach(fruits.indices, id: \.self) { index in
                    Text(fruits[index])
                }
            }

            List {
                ForEach(0..<5) { index in
                    Text("Index: \(index)")
                }
            }

        }
    }
    
}

#Preview {
    ForEachDemo()
}
