//
//  ForEachDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/17/24.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/foreach
// ForEach allows you to iterate over collections or ranges to create multiple views dynamically.

struct ForEachDemo: View {

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

    @State var selection: Item?

    var body: some View {
        HStack {

            List(items, id: \.self, selection: $selection) { item in
                Text(item.name)
            }

            // 사용되는 element 가 Identifiable 일 경우, id 프로퍼티를 hash 에 사용한다.
            // Identifiable 이 아닐 경우, hash 에 사용할 프로퍼티의 키패스를 id 인자로 넘겨야 한다.
            // id 프로퍼티는 당연히 Hashable 해야 한다.

            List(selection: $selection) {
                ForEach(items, id: \.self) { item in
                    Text(item.name)
                }
                Text(item4.name).tag(item4)
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
