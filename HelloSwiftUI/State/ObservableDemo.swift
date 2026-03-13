//
//  ObservableDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/17/24.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/state

struct ObservableDemo: View {

    @Observable
    class Model {
        var counter = 0
    }

    // @Observable에는 @State 를 쓴다. @StateObject 아니다.
    @State private var model = Model()

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("Observable Demo")
                .font(.title)

            VStack(alignment: .leading, spacing: 8) {
                Text("Demo")
                    .font(.title2)
                Text("counter: \(model.counter)")
                Button("Increase counter") {
                    model.counter += 1
                }
                Stepper(value: $model.counter) {
                    Text("Stepper")
                }
            }

            // 1. Subview 에 @Bindable 없이 그냥 넘겨도 Subview 에서 업데이트할 수 있다.
            // 2. @Bindable 에 넘길 때도 그냥 넘긴다. $ 붙이지 않는다.
            EditView(model: model, bindableModel: model)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(32)
    }

    struct EditView: View {
        let model: Model
        @Bindable var bindableModel: Model

        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text("EditView")
                    .font(.title2)
                Text("parent counter: \(model.counter)")
                Button("Increase counter") {
                    model.counter += 1
                }
                Stepper(value: $bindableModel.counter) {
                    Text("Stepper")
                }
            }
        }
    }

}

#Preview {
    ObservableDemo()
}
