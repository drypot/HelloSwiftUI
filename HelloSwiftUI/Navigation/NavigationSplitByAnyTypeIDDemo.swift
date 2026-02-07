//
//  NavigationSplitByAnyTypeIDDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/22/24.
//

import SwiftUI

struct NavigationSplitByAnyTypeIDDemo: View {

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

    // Box

    struct Box: Identifiable, Hashable {
        let id: String

        var name: String {
            return id
        }
    }

    static let boxes = [
        Box(id: "Box 1"),
        Box(id: "Box 2"),
        Box(id: "Box 3"),
    ]

    static let boxDic = Dictionary(uniqueKeysWithValues: boxes.map { ($0.id, $0) })

    // AnySelection

    enum AnySelection: Hashable {
        case product(id: Product.ID)
        case box(id: Box.ID)
    }

    // State

    @State var anySelection: AnySelection?
    @State var selectedPartIDs: Set<Part.ID> = []

    var body: some View {
        NavigationSplitView {
            List(selection: $anySelection) {
                Section("Products") {
                    ForEach(Self.products) { product in
                        Text(product.name)
                            .tag(AnySelection.product(id: product.id))
                    }
                }
                Section("Boxes") {
                    ForEach(Self.boxes) { box in
                        Text(box.name)
                            .tag(AnySelection.box(id: box.id))
                    }
                }
            }
        } content: {
            switch anySelection {
            case .product(let id):
                let product = Self.productDic[id]!
                let parts = product.parts
                List(parts, selection: $selectedPartIDs) { part in
                    Text(part.name)
                }
            case .box:
                List {
                }
            case nil:
                Spacer()
            }
        } detail: {
            switch anySelection {
            case .product(_):
                let parts = selectedPartIDs.sorted().compactMap { Self.partDic[$0] }
                List(parts) { part in
                    Text("\(part.name) detail")
                }
            case .box(let id):
                let box = Self.boxDic[id]!
                List {
                    Text("\(box.name) detail")
                }
            case nil:
                Spacer()
            }
        }
        .toolbarBackground(.hidden) // macOS 26, 툴바 구분선이 나왔다 사라졌다 한다, 강제로 감추는 옵션.
        .navigationTitle("NavigationSplit by AnyTypeID Demo")
    }

}

#Preview {
    NavigationSplitByAnyTypeIDDemo()
}
