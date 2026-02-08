//
//  StateDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/3/24.
//

import SwiftUI

struct StateDemo: View {
    @State private var counter = 10

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("State Demo")
                .font(.title)

            VStack(alignment: .leading, spacing: 8) {
                Text("Demo")
                    .font(.title2)
                Text("counter: \(counter)")
                HStack {
                    Button("Increase counter") {
                        counter += 1
                    }
                }
            }

            ReadOnlyView(parentCounter: counter)
            EditView(parentCounter: $counter)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(32)
    }

    struct ReadOnlyView: View {
        var parentCounter: Int
        @State private var counter: Int = 10

        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text("ReadOnlyView")
                    .font(.title2)
                Text("parentCounter: \(parentCounter), counter: \(counter)")
                Button("Increase counter") {
                    counter += 1
                }
            }
        }
    }

    struct EditView: View {
        @Binding var parentCounter: Int
        @State var counter: Int = 10

        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text("EditView")
                    .font(.title2)
                Text("parentCounter: \(parentCounter), counter: \(counter)")
                Button("Increase parent counter") {
                    parentCounter += 1
                }
                Button("Increase counter") {
                    counter += 1
                }
            }
        }
    }

}

#Preview {
    StateDemo()
}
