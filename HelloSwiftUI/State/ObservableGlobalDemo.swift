//
//  ObservableDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/17/24.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/state

struct ObservableGlobalDemo: View {

    @Observable
    class Model {
        var counter = 0

        static let shared = Model()
    }

    private var model = Model.shared

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("Observable Global Demo")
                .font(.title)

            VStack(alignment: .leading, spacing: 8) {
                Text("Demo")
                    .font(.title2)
                Text("counter: \(model.counter)")
                HStack {
                    Button("Increase counter") {
                        model.counter += 1
                    }
                }
            }

            EditView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(32)
    }

    struct EditView: View {
        private var model = Model.shared

        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text("EditView")
                    .font(.title2)
                Text("parent counter: \(model.counter)")
                Button("Increase counter") {
                    model.counter += 1
                }
                do {
                    // 일반 오브젝트는 @Bindable을 수동으로 만들어줘야 한다.
                    @Bindable var model = model
                    Stepper(value: $model.counter) {
                        Text("Stepper")
                    }
                }
            }
        }
    }

}

#Preview {
    ObservableGlobalDemo()
}
