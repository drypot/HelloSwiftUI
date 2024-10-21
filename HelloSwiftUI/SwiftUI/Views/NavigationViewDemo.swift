//
//  NavigationViewDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/17/24.
//

import SwiftUI

struct NavigationViewDemo: View {

    let products = ["Product1", "Product2", "Product3"]

    var body: some View {
        NavigationView {
            List(products, id: \.self) { product in
                NavigationLink(destination: DetailView(product: product)) {
                    Text(product)
                }
            }

            Text("NavigationView is deprecated")
        }
    }

    struct DetailView: View {
        let parts = ["Part1", "Part2", "Part3"]
        let product: String

        var body: some View {
            NavigationView {
                List(parts, id: \.self) { part in
                    NavigationLink(destination: Text(part)) {
                        Text(part)
                    }
                }

                Text("Select a part")
            }
        }
    }
}

#Preview {
    NavigationViewDemo()
}
