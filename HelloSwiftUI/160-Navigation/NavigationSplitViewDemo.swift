//
//  NavigationSplitViewDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/22/24.
//

import SwiftUI

struct NavigationSplitViewDemo: View {

    enum DemoTypes: String, CaseIterable {
        case byID = "by ID"
        case byLink = "by Link"
        case byValue = "by Value"
        case withDestination = "by Value with Destination"
        case anyTypesByID = "Any Types by ID"
        case anyTypesByValue = "Any Types by Value"
    }

    struct Product: Identifiable, Hashable {
        let id = UUID()
        let name: String
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

    struct Storage {
        let products: [Product]
        let parts: [Product.ID: [Part]]
        let boxes: [Box]

        init() {
            products = [
                Product(name:"Product 1"),
                Product(name:"Product 2"),
                Product(name:"Product 3"),
            ]
            parts = [
                products[0].id: [Part(name: "P1"), Part(name: "P2"), Part(name: "P3")],
                products[1].id: [Part(name: "P4"), Part(name: "P5"), Part(name: "P6")],
                products[2].id: [Part(name: "P7"), Part(name: "P8"), Part(name: "P9")],
            ]
            boxes = [
                Box(name: "Box 1"),
                Box(name: "Box 2"),
                Box(name: "Box 3"),
            ]
        }
    }

    static let storage = Storage()

    @State var selectedProductID = Self.storage.products[0].id
    @State var selectedProduct = Self.storage.products[0]

    @State var selectedPartID: Part.ID?
    @State var selectedPartIDs: Set<Part.ID> = []
    @State var selectedParts: Set<Part> = []

    @State var selectedBoxID = Self.storage.boxes[0].id

    @State var anySelection: AnySelection = .product(id: Self.storage.products[0].id)

    @State var demoType = DemoTypes.byID

    var body: some View {
        switch demoType {
        case .byID:
            // id 로 상태관리하고 나머지는 수작업.
            // 좀 난잡해 지긴 하지만 유연성이 좋다.
            NavigationSplitView {
                List(Self.storage.products, selection: $selectedProductID) { product in
                    Text(product.name)
                }
                DemoTypeList(demoType: $demoType)
            } content: {
                let product = Self.storage.products.first { $0.id == selectedProductID }!
                let parts = Self.storage.parts[product.id]!
                List(parts, selection: $selectedPartIDs) { part in
                    Text(part.name)
                }
            } detail: {
                let product = Self.storage.products.first { $0.id == selectedProductID }!
                let parts = Self.storage.parts[product.id]!.filter { selectedPartIDs.contains($0.id) }
                PartsDetail(parts: parts)
            }
            .navigationTitle(demoType.rawValue)

        case .byLink:
            NavigationSplitView {
                let product = Self.storage.products[0]
                List(selection: $selectedProduct) {
                    NavigationLink(product.name, value: product)
                }
                DemoTypeList(demoType: $demoType)
            } content: {
                let product = Self.storage.products[0]
                let parts = Self.storage.parts[product.id]!
                List {
                    // NavigationLink 에 ViewBuilder 바로 붙일 수 있다.
                    // 루프 돌리기 적합하지 않은 링크 셋 구성에 사용.
                    NavigationLink(parts[0].name) { PartDetail(part: parts[0]) }
                    NavigationLink(parts[1].name) { PartDetail(part: parts[1]) }
                    NavigationLink(parts[2].name) { PartDetail(part: parts[2]) }
                }
            } detail: {
                Spacer()
            }
            .navigationTitle(demoType.rawValue)

        case .byValue:
            NavigationSplitView {
                // NavigationLink 가 List 안에 있을 경우,
                // NavigationLink 링크 클릭시 NavigationLink value 값을
                // List selection 바인딩 변수에 넣어준다고 한다.
                // 전반적으로 이 방식이 제일 이뻐보인다.
                List(Self.storage.products, selection: $selectedProduct) { product in
                    NavigationLink(product.name, value: product)
                }
                .onAppear {
                    selectedProduct = Self.storage.products[0]
                }
                .onChange(of: selectedProduct) { oldValue, newValue in
                    let parts = Self.storage.parts[newValue.id]!
                    selectedParts = [parts[0]]
                }
                DemoTypeList(demoType: $demoType)
            } content: {
                let parts = Self.storage.parts[selectedProduct.id]!
                List(parts, selection: $selectedParts) { part in
                    NavigationLink(part.name, value: part)
                }
            } detail: {
                PartsDetail(parts: Array(selectedParts))
            }
            .navigationTitle(demoType.rawValue)

        case .withDestination:
            // List selection 변수와 상관없이
            // NavigationLink value 와
            // value 를 받는 navigationDestination 조합으로 사용할 수도 있다.
            // 첫번째 컬럼에 로직이 너무 몰린다.
            // SplitView 보다는 StackView 에 더 어울리는 것 같다.
            NavigationSplitView {
                List(Self.storage.products, selection: $selectedProductID) { product in
                    NavigationLink(product.name, value: product)
                }
                .navigationDestination(for: Product.self) { product in
                    let parts = Self.storage.parts[product.id]!
                    List(parts, selection: $selectedPartID ) { part in
                        NavigationLink(part.name, value: part)
                    }
                    .navigationDestination(for: Part.self) { part in
                        PartDetail(part: part)
                    }
                }
                DemoTypeList(demoType: $demoType)
            } content: {
                Spacer()
            } detail: {
                Spacer()
            }
            .navigationTitle(demoType.rawValue)

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
                DemoTypeList(demoType: $demoType)
            } content: {
                switch anySelection {
                case .product(let id):
                    let product = Self.storage.products.first { $0.id == id }!
                    let parts = Self.storage.parts[product.id]!
                    List(parts, selection: $selectedPartIDs) { part in
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
                    let parts = Self.storage.parts[product.id]!.filter { selectedPartIDs.contains($0.id) }
                    PartsDetail(parts: parts)
                case .box(let id):
                    let box = Self.storage.boxes.first { $0.id == id }!
                    BoxDetail(box: box)
                }
            }
            .navigationTitle(demoType.rawValue)

        case .anyTypesByValue:
            NavigationSplitView {
                List(selection: $anySelection) {
                    Section("Products") {
                        ForEach(Self.storage.products) { product in
                            NavigationLink(product.name, value: product)
                                .tag(AnySelection.product(id: product.id))
                        }
                    }
                    Section("Boxes") {
                        ForEach(Self.storage.boxes) { box in
                            NavigationLink(box.name, value: box)
                                .tag(AnySelection.box(id: box.id))
                        }
                    }
                }
                .navigationDestination(for: Product.self) { product in
                    let parts = Self.storage.parts[product.id]!
                    List(parts, selection: $selectedPartID ) { part in
                        NavigationLink(part.name, value: part)
                    }
                    .navigationDestination(for: Part.self) { part in
                        PartDetail(part: part)
                    }
                }
                .navigationDestination(for: Box.self) { box in
                    BoxDetail(box: box)
                }
                DemoTypeList(demoType: $demoType)
            } content: {
                Spacer()
            } detail: {
                Spacer()
            }
            .navigationTitle(demoType.rawValue)

        }
        
    }

    struct PartDetail: View {
        let part: Part
        var body: some View {
            List {
                Text("\(part.name) detail")
            }
        }
    }

    struct PartsDetail: View {
        let parts: [Part]
        var body: some View {
            List(parts) { part in
                Text("\(part.name) detail")
            }
        }
    }

    struct BoxDetail: View {
        let box: Box
        var body: some View {
            List {
                Text("\(box.name) detail")
            }
        }
    }

    struct DemoTypeList: View {
        @Binding var demoType: DemoTypes
        var body: some View {
            Spacer()
            List(DemoTypes.allCases, id:\.self, selection: $demoType) { demo in
                Text(demo.rawValue)
            }
            .frame(maxHeight: 180)
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
