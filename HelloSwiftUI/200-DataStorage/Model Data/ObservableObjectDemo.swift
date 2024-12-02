//
//  ObservableObjectDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/17/24.
//

import SwiftUI

struct ObservableObjectDemo: View {

    class Model: ObservableObject {
        @Published var counter = 0
        @Published var name: String = ""
    }

    @State private var isPresented = true

    var body: some View {
        VStack {
            Button("Toggle View") {
                isPresented.toggle()
            }
            .padding()

            if isPresented {
                BaseView()
            } else {
                Spacer()
            }
        }
    }

    struct BaseView: View {
        // ObservableObject 를 관리하기 위해선 @State 가 아닌 @StateObject 를 쓴다.
        @StateObject private var model = Model()

        var body: some View {
            Form {
                Text("ObservableObject Demo")
                    .font(.title)

                ReadOnlySubView(model: model)

                // @Bindable 에 넘길 때 $ 를 붙이지 않는다.
                BindingSubView(model: model)
            }
            .formStyle(.grouped)
        }
    }

    struct ReadOnlySubView: View {
        // read-only 로 쓴다고 해도 @ObservedObject 로 받아야 변경 사항이 업데이트 된다.
        @ObservedObject var model: Model

        var body: some View {
            Section {
                Text("ReadOnly View")
                    .font(.headline)
                    .padding(4)
                LabeledContent("Counter") {
                    Text("\(model.counter)")
                }
                LabeledContent("Name") {
                    Text(model.name.isEmpty ? "---" : model.name)
                }
            }
        }
    }

    struct BindingSubView: View {
        @ObservedObject var model: Model

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
                TextField("Name", text: $model.name)
                    .textFieldStyle(.roundedBorder)
            }
        }
    }

}

#Preview {
    ObservableObjectDemo()
}
