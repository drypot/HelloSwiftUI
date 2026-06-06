//
//  ObservableToggleBoolDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 5/9/26.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/state

struct ObservableToggleBoolDemo: View {

    @Observable
    class Model {
        var hasError: Bool = false

        @ObservationIgnored
        var hasIgnoredError: Bool = false
    }

    // @Observable에는 @State 를 쓴다. @StateObject 아니다.
    @State private var model = Model()

    var body: some View {
        let _ = print("---")
        VStack(alignment: .leading, spacing: 32) {
            Text("Observable HasError Demo")
                .font(.title)

            VStack(alignment: .leading, spacing: 16) {
                Text("hasError: \(model.hasError.description)")

                Button("Make Error") {
                    model.hasError = true
                }
                Button("Clear Error") {
                    model.hasError = false
                }

                Text("hasError: \(model.hasIgnoredError.description)")

                Button("Make IgnoredError") {
                    model.hasIgnoredError = true
                }
                Button("Clear IgnoredError") {
                    model.hasIgnoredError = false
                }
            }
            .onChange(of: model.hasError) {
                print("onChange of model.hasError:")
                if model.hasError {
                    print("model.hasError:")
                    model.hasError = false
                } else {
                    print("else:")
                }
            }
            .onChange(of: model.hasIgnoredError) {
                print("onChange of model.hasIgnoredError:")
                if model.hasIgnoredError {
                    print("model.hasIgnoredError:")
                    model.hasIgnoredError = false
                } else {
                    print("else:")
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
