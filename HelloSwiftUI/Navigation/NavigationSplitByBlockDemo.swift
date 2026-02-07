//
//  NavigationSplitByBlockDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/22/24.
//

import SwiftUI

struct NavigationSplitByBlockDemo: View {

    // Part

    // NavigationLink 에 사용되는 value 는 Hashable 해야 한다.
    // SwifUI 가 프로퍼티 변경을 감지하기 위해 hash를 사용할 수도 있다.

    struct Part: Identifiable, Hashable {
        let id: String
        var name: String {
            return id
        }
    }

    static let parts: [Part] = [
        Part(id: "Part 1"),
        Part(id: "Part 2"),
        Part(id: "Part 3"),
        Part(id: "Part 4"),
        Part(id: "Part 5"),
        Part(id: "Part 6"),
    ]

    static let partDic = Dictionary(uniqueKeysWithValues: parts.map { ($0.id, $0) })

    // Product

    struct Product: Identifiable, Hashable {
        let id: String

        var name: String {
            return id
        }

        let parts: [Part]

        init(id: String, partIDs: [Part.ID]) {
            self.id = id
            self.parts = partIDs.compactMap { partDic[$0]! }
        }
    }

    static let products = [
        Product(id: "Product 1", partIDs: ["Part 1", "Part 2", "Part 3"]),
        Product(id: "Product 2", partIDs: ["Part 4", "Part 5", "Part 6"]),
        Product(id: "Product 3", partIDs: ["Part 1", "Part 2", "Part 6"]),
    ]

    // static let productDic = Dictionary(uniqueKeysWithValues: products.map { ($0.id, $0) })

    // State

    // @State var selectedProduct: Product?
    // @State var selectedPart: Part?

    var body: some View {
        NavigationSplitView {
            let product = Self.products[0]
            List {
                NavigationLink(product.name, value: product)
            }
        } content: {
            let parts = Self.products[0].parts
            List {
                // NavigationLink 에 destination 블럭을 바로 붙일 수도 있다.
                NavigationLink(parts[0].name) { Text("\(parts[0].name) detail") }
                NavigationLink(parts[1].name) { Text("\(parts[1].name) detail") }
                NavigationLink(parts[2].name) { Text("\(parts[2].name) detail") }
            }
        } detail: {
            // ...
        }
        .toolbarBackground(.hidden) // macOS 26, 툴바 구분선이 나왔다 사라졌다 한다, 강제로 감추는 옵션.
        .navigationTitle("NavigationSplit by Block Demo")
    }

}

#Preview {
    NavigationSplitByBlockDemo()
}
