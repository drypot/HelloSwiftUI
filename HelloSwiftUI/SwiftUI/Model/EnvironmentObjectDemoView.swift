//
//  EnvironmentObjectDemoView.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/17/24.
//

import SwiftUI

struct EnvironmentObjectDemoView: View {

    enum ProductTypes: String, CaseIterable {
        case product1 = "Product1"
        case product2 = "Product2"
        case product3 = "Product3"
    }

    class AppState: ObservableObject {
        @Published var productsInStock: Set<ProductTypes> = [.product1, .product2]
    }

    var appState = AppState()

    var body: some View {
        NavigationView {
            List {
                ForEach(ProductTypes.allCases, id:\.self) { product in
                    NavigationLink(destination: DetailView(product: product)) {
                        Text(product.rawValue)
                    }
                }
            }
            .listStyle(.sidebar)

            Text("Select an item")
        }
        .frame(minWidth: 500, minHeight: 300)
        .environmentObject(appState)
    }

    struct DetailView: View {
        @EnvironmentObject var appState: AppState

        let product: ProductTypes

        var body: some View {
            VStack {
                Text(product.rawValue)
                    .padding()
                if appState.productsInStock.contains(product) {
                    Text("In stock")
                } else {
                    Text("Out of stock")
                }
            }
        }
    }

}

#Preview {
    EnvironmentObjectDemoView()
}
