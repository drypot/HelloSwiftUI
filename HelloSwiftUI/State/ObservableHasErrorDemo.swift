//
//  ObservableHasErrorDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 5/9/26.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/state

struct ObservableHasErrorDemo: View {

    @Observable
    class Model {
        var hasError: Bool = false
    }

    // @Observable에는 @State 를 쓴다. @StateObject 아니다.
    @State private var model = Model()

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("Observable HasError Demo")
                .font(.title)

            VStack(alignment: .leading, spacing: 8) {
                Text("Demo")
                    .font(.title2)
                Text("hasError: \(model.hasError.description)")
                Button("Make Error") {
                    model.hasError = true
                }
            }
        }
        .padding(32)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .alert(
            "",
            isPresented: $model.hasError,
            actions: {
                Button("OK") {

                }
            },
            message: {
                Text("Error Occurred")
            }
        )
    }
}

#Preview {
    ObservableDemo()
}
