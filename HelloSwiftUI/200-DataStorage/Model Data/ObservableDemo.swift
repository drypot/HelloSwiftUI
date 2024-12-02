//
//  ObservableDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/19/24.
//

import SwiftUI

// https://developer.apple.com/documentation/observation
// https://developer.apple.com/documentation/swiftui/managing-model-data-in-your-app
// https://developer.apple.com/documentation/swiftui/migrating-from-the-observable-object-protocol-to-the-observable-macro

@Observable fileprivate class GlobalModel {
    var counter = 0

    @MainActor static let shared = GlobalModel()
}

struct ObservableDemo: View {

    @Observable class Model {
        var counter = 0
        var name: String = ""
    }

    @Observable class EnvironmentModel {
        var counter = 0
    }

    @State private var isPresented = true
    @State private var environmentModel = EnvironmentModel()

    var body: some View {
        VStack {
            Button("Toggle View") {
                isPresented.toggle()
            }
            .padding()

            if isPresented {
                BaseView()
                    .environment(environmentModel)
            } else {
                Spacer()
            }
        }
    }

    struct BaseView: View {
        // @Observable 상태를 관리하기 위해선 @StateObject 가 아닌 @State 를 쓴다.
        @State private var model = Model()

        var body: some View {
            Form {
                Text("Observable Demo")
                    .font(.title)

                ReadOnlySubView(model: model)

                // @Bindable 에 넘길 때 $ 를 붙이지 않는다.
                BindingSubView(model: model)
            }
            .formStyle(.grouped)
        }
    }

    struct ReadOnlySubView: View {
        let model: Model
        @Environment(EnvironmentModel.self) private var environmentModel

        var body: some View {
            Section {
                Text("ReadOnly View")
                    .font(.headline)
                    .padding(4)
                LabeledContent("Counter") {
                    Text("\(model.counter)")
                }
                LabeledContent("Global Counter") {
                    Text("\(GlobalModel.shared.counter)")
                }
                LabeledContent("Global Counter") {
                    Text("\(environmentModel.counter)")
                }
                LabeledContent("Name") {
                    Text(model.name.isEmpty ? "---" : model.name)
                }
            }
        }
    }

    struct BindingSubView: View {
        // 서브 뷰로 바인딩이 필요하면 @Binging 대신 @Bindable 을 쓴다.
        @Bindable var model: Model
        @Environment(EnvironmentModel.self) private var environmentModel

        var body: some View {
            Section {
                Text("Binding View")
                    .font(.headline)
                    .padding(4)
                LabeledContent("Counter") {
                    Button("Increment") {
                        model.counter += 1
                    }
                }
                LabeledContent("Global Counter") {
                    Button("Increment") {
                        GlobalModel.shared.counter += 1
                    }
                }
                LabeledContent("Environment Counter") {
                    Button("Increment") {
                        environmentModel.counter += 1
                    }
                }
                TextField("Name", text: $model.name)
                    .textFieldStyle(.roundedBorder)
            }
        }
    }

}

#Preview {
    ObservableObjectDemo()
}
