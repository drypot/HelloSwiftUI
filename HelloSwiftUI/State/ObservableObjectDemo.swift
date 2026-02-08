//
//  ObservableObjectDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/17/24.
//

import SwiftUI
import Combine

struct ObservableObjectDemo: View {

    class Model: ObservableObject {
        @Published var counter = 0
    }

    // ObservableObject 에는 @State 대신 @StateObject 를 쓴다.
    @StateObject private var model = Model()

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("ObservableObject Demo")
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

            EditView(model: model)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(32)
    }

    struct EditView: View {
        // read-only 로 쓴다고 해도 ObservableObject 는 @ObservedObject 로 받아야 변경 사항이 업데이트 된다.
        @ObservedObject var model: Model

        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text("EditView")
                    .font(.title2)
                Text("parent counter: \(model.counter)")
                Button("Increase counter") {
                    model.counter += 1
                }
                // @ObservedObject 는 $ 를 지원한다.
                // @Observable 과 다르게 @Bindable 만들 필요가 없다.
                Stepper(value: $model.counter) {
                    Text("Stepper")
                }
            }
        }
    }

}

#Preview {
    ObservableObjectDemo()
}
