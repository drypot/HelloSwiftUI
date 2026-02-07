//
//  NavigationSplitByIDDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/22/24.
//

import SwiftUI

struct NavigationSplitByIDDemo: View {

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

    static let productDic = Dictionary(uniqueKeysWithValues: products.map { ($0.id, $0) })

    // State
    
    @State var selectedProductID: Product.ID?
    @State var selectedPartIDs: Set<Part.ID> = []

    var body: some View {

        // id 로 상태관리하고 나머지는 수작업.
        // id, value 따로 관리하려니 좀 난잡해 진다.
        // 하지만 유연성이 좋다.

        NavigationSplitView {
            List(Self.products, selection: $selectedProductID) { product in
                Text(product.name)
            }
        } content: {
            if let selectedProductID {
                let product = Self.productDic[selectedProductID]!
                List(product.parts, selection: $selectedPartIDs) { part in
                    Text(part.name)
                }
            }
        } detail: {
            let parts = selectedPartIDs.sorted().compactMap { Self.partDic[$0] }
            List(parts) { part in
                Text("\(part.name) detail")
            }
        }
        .toolbarBackground(.hidden) // macOS 26, 툴바 구분선이 나왔다 사라졌다 한다, 강제로 감추는 옵션.
        .navigationTitle("NavigationSplit by ID Demo")
    }

}

#Preview {
    NavigationSplitByIDDemo()
}
