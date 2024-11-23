//
//  NavigationSplitViewDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/22/24.
//

import SwiftUI

struct NavigationSplitViewDemo: View {

    enum DemoTypes: String, CaseIterable {
        case byID = "By ID"
        case byValue = "By Value"
        case anyTypesByID = "Any Types"
        case anyTypesByValue = "Any Types By Value"
    }

    struct Product: Identifiable, Hashable {
        let id = UUID()
        let name: String
        let parts: [Part]
    }

    struct Part: Identifiable, Hashable {
        let id = UUID()
        let name: String
    }

    struct Box: Identifiable, Hashable {
        let id = UUID()
        let name: String
    }

    enum AnySelection: Hashable {
        case product(id: Product.ID)
        case box(id: Box.ID)
    }

    class Storage {
        let products = [
            Product(
                name:"Product 1",
                parts: [Part(name: "P1"), Part(name: "P2"), Part(name: "P3")]
            ),
            Product(
                name:"Product 2",
                parts: [Part(name: "P4"), Part(name: "P5"), Part(name: "P6")]
            ),
            Product(
                name:"Product 3",
                parts: [Part(name: "P7"), Part(name: "P8"), Part(name: "P9")]
            ),
        ]

        let boxes = [
            Box(name: "Box 1"),
            Box(name: "Box 2"),
            Box(name: "Box 3"),
        ]
    }

    static let storage = Storage()

    @State var productID = Self.storage.products[0].id
    @State var partID = Self.storage.products[0].parts[0].id
    @State var partIDs: Set<Part.ID> = []

    @State var boxID = Self.storage.boxes[0].id

    @State var anySelection: AnySelection = .product(id: Self.storage.products[0].id)

    @State var demoType = DemoTypes.byID

    var body: some View {
        switch demoType {
        case .byID:
            NavigationSplitView {
                List(Self.storage.products, selection: $productID) { product in
                    Text(product.name)
                }
                Spacer()
                DemoTypeList(demoType: $demoType)
            } content: {
                let product = Self.storage.products.first { $0.id == productID }!
                List(product.parts, selection: $partIDs) { part in
                    Text(part.name)
                }
            } detail: {
                let product = Self.storage.products.first { $0.id == productID }!
                let parts = product.parts.filter { partIDs.contains($0.id) }
                List(parts) { part in
                    Text("\(part.name) detail")
                        .padding()
                }
            }

        case .byValue:
            NavigationSplitView {
                List(Self.storage.products, selection: $productID) { product in
                    NavigationLink(product.name, value: product)
                }
                .navigationDestination(for: Product.self) { product in
                    List(product.parts, selection: $partID ) { part in
                        NavigationLink(part.name, value: part)
                    }
                    .navigationDestination(for: Part.self) { part in
                        Text("\(part.name) detail")
                            .padding()
                    }
                }
                Spacer()
                DemoTypeList(demoType: $demoType)
            } content: {
                Spacer()
            } detail: {
                Spacer()
            }

        case .anyTypesByID:
            NavigationSplitView {
                List(selection: $anySelection) {
                    Section("Products") {
                        ForEach(Self.storage.products) { product in
                            Text(product.name)
                                .tag(AnySelection.product(id: product.id))
                        }
                    }
                    Section("Boxes") {
                        ForEach(Self.storage.boxes) { box in
                            Text(box.name)
                                .tag(AnySelection.box(id: box.id))
                        }
                    }
                }
                Spacer()
                DemoTypeList(demoType: $demoType)
            } content: {
                switch anySelection {
                case .product(let id):
                    let product = Self.storage.products.first { $0.id == id }!
                    List(product.parts, selection: $partIDs) { part in
                        Text(part.name)
                    }
                case .box:
                    List {
                    }
                }
            } detail: {
                switch anySelection {
                case .product(let id):
                    let product = Self.storage.products.first { $0.id == id }!
                    let parts = product.parts.filter { partIDs.contains($0.id) }
                    List(parts) { part in
                        Text("\(part.name) detail")
                            .padding()
                    }
                case .box(let id):
                    let box = Self.storage.boxes.first { $0.id == id }!
                    List {
                        Text("\(box.name) detail")
                            .padding()
                    }
                }
            }

        case .anyTypesByValue:
            Spacer()
//            원하는 대로 동작 하게 만들기 힘들다.
//            box 의 경우 content 를 스킵하고 detail 에 표시해야 하는데.
//            어떻게 하지?
//            나중에 다시 해보자.
//            NavigationSplitView {
//                List(selection: $anySelection) {
//                    Section("Products") {
//                        ForEach(Self.storage.products) { product in
//                            NavigationLink(product.name, value: product)
//                                .tag(AnySelection.product(id: product.id))
//                        }
//                    }
//                    Section("Boxes") {
//                        ForEach(Self.storage.boxes) { box in
//                            NavigationLink(box.name, value: box)
//                                .tag(AnySelection.box(id: box.id))
//                        }
//                    }
//                }
//                .navigationDestination(for: Product.self) { product in
//                    List(product.parts, selection: $partID ) { part in
//                        NavigationLink(part.name, value: part)
//                    }
//                    .navigationDestination(for: Part.self) { part in
//                        Text("\(part.name) detail")
//                            .padding()
//                    }
//                }
//                .navigationDestination(for: Box.self) { box in
//                    List {
//                        NavigationLink(box.name, value: box)
//                            .tag(box.id)
//                    }
//                    .navigationDestination(for: Box.self) { box in
//                        Text("\(box.name) detail")
//                            .padding()
//                    }
//                }
//                Spacer()
//                DemoTypeList(demoType: $demoType)
//            } content: {
//                Spacer()
//            } detail: {
//                Spacer()
//            }

        }
        
    }

    struct DemoTypeList: View {
        @Binding var demoType: DemoTypes
        var body: some View {
            List(DemoTypes.allCases, id:\.self, selection: $demoType) { demo in
                Text(demo.rawValue)
            }
            .frame(maxHeight: 150)
        }
    }

}

struct NavigationSplitViewDemoPlaceholder: View {
    @Environment(\.openWindow) private var openWindow
    var body: some View {
        VStack {
            Button("Open NavigationSplitView Demo") {
                openWindow(id: "NavigationSplitViewDemo")
            }
        }
    }
}

#Preview {
    NavigationSplitViewDemo()
}
