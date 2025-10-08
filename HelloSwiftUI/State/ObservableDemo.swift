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

        static let shared = Model()
    }

    // ObservableObject는 오브젝트 단위에서 변경 알림이 발생한다.
    // Observable은 프로퍼티 단위에서 변경 알림이 발생한다.
    // 더 효율적인 View 갱신이 가능.

    // @State 들은 private 으로 선언한다.
    // private 이 없어서 실수로 memberwise initializer 를 넣으면
    // 뷰 생성마다 State 가 초기화된다.

    // View 를 날렸다 다시 만들면 @State data 가 초기화 됨을 확인하기 위해 isPresented 를 쓴다.

    @State private var isPresented = true
    @State private var envModel = Model()

    var body: some View {
        Form {
            Text("Observable Demo")
                .font(.title)

            Button("Toggle View") {
                isPresented.toggle()
            }
            .padding()

            if isPresented {
                ParentView()
                    .environment(envModel)
            } else {
                Spacer()
            }
        }
        .formStyle(.grouped)
    }

    struct ParentView: View {
        @State private var counter = 0
        // @Observable 상태관리에는 @StateObject 대신 걍 @State 를 쓴다.
        @State private var model = Model()
        @Environment(Model.self) private var envModel
        private var globalModel = Model.shared

        var body: some View {
            Section {
                Text("Base View")
                    .font(.headline)
                    .padding(4)
                LabeledContent("local counter") {
                    Stepper(value: $counter) {
                        Text("\(counter)")
                    }
                }
                LabeledContent("local model counter") {
                    Stepper(value: $model.counter) {
                        Text("\(model.counter)")
                    }
                }
                // @Environment 는 $ 프로젝션을 제공하지 않아서 Binding이 필요하면 수동으로 만들어줘야 한다.
                LabeledContent("environment model counter") {
                    let binding = Binding(
                        get: { envModel.counter },
                        set: { envModel.counter = $0 }
                    )
                    Stepper(value: binding) {
                        Text("\(envModel.counter)")
                    }
                }
                LabeledContent("global model counter") {
                    let binding = Binding(
                        get: { globalModel.counter },
                        set: { globalModel.counter = $0 }
                    )
                    Stepper(value: binding) {
                        Text("\(globalModel.counter)")
                    }
                }
            }

            ReadOnlySubView(counter: counter, model: model)

            // @Bindable 에 넘길 때 $ 를 붙이지 않는다.
            ReadWriteSubView(counter: $counter, model: model)
        }

    }

    struct ReadOnlySubView: View {
        var counter: Int
        let model: Model
        @Environment(Model.self) private var envModel
        private let globalModel = Model.shared

        var body: some View {
            Section {
                Text("ReadOnly SubView")
                    .font(.headline)
                    .padding(4)
                LabeledContent("parent counter") {
                    Text("\(counter)")
                }
                LabeledContent("parent model counter") {
                    Text("\(model.counter)")
                }
                LabeledContent("environment model counter") {
                    Text("\(envModel.counter)")
                }
                LabeledContent("global model counter") {
                    Text("\(globalModel.counter)")
                }
            }
        }
    }

    struct ReadWriteSubView: View {
        // @Observable 이 아닌 @State 에 대한 바인딩이 필요하면 @Binding 으로 받는다.
        @Binding var counter: Int
        // @Observable @State 에 대한 바인딩이 필요하면 @Binging 대신 @Bindable 로 받는다.
        @Bindable var model: Model
        @Environment(Model.self) private var envModel
        private let globalModel = Model.shared

        var body: some View {
            Section {
                Text("ReadWrite SubView")
                    .font(.headline)
                    .padding(4)
                LabeledContent("parent counter") {
                    Stepper(value: $counter) {
                        Text("\(counter)")
                    }
                }
                LabeledContent("parent model counter") {
                    Stepper(value: $model.counter) {
                        Text("\(model.counter)")
                    }
                }
                // @Environment 는 $ 프로젝션을 제공하지 않아서 Binding이 필요하면 수동으로 만들어줘야 한다.
                LabeledContent("environment model counter") {
                    let binding = Binding(
                        get: { envModel.counter },
                        set: { envModel.counter = $0 }
                    )
                    Stepper(value: binding) {
                        Text("\(envModel.counter)")
                    }
                }
                LabeledContent("global model counter") {
                    let binding = Binding(
                        get: { globalModel.counter },
                        set: { globalModel.counter = $0 }
                    )
                    Stepper(value: binding) {
                        Text("\(globalModel.counter)")
                    }
                }
            }
        }
    }

}

#Preview {
    ObservableDemo()
}
