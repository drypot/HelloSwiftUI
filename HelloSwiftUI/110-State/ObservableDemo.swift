//
//  ObservableDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/17/24.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/state

@Observable fileprivate class GlobalModel {
    var counter = 0

    @MainActor static let shared = GlobalModel()
}

struct ObservableDemo: View {

    // ObservableObject는 전체 객체에 대해 View가 갱신된다.
    // Observable은 변경된 속성만 추적하여 더 정밀한 View 업데이트 가능.

    @Observable class Model {
        var counter = 0
    }

    // @State 들은 private 으로 선언한다.
    // private 이 없어서 실수로 memberwise initializer 를 넣으면
    // 뷰 생성마다 State 가 초기화된다.

    @State private var isPresented = true
    @State private var envModel = Model()

    var body: some View {
        VStack {

            // View 를 날렸다 다시 만들면 @State data 가 초기화 됨을 확인하기 위한 절차.
            // 실제 State 데모는 아래 BaseView 부터 시작된다.

            Button("Toggle View") {
                isPresented.toggle()
            }
            .padding()

            if isPresented {
                BaseView()
                    .environment(envModel)
            } else {
                Spacer()
            }
        }
    }

    struct BaseView: View {
        @State private var counter = 0

        // @Observable 상태관리에는 @StateObject 대신 걍 @State 를 쓴다.
        @State private var model = Model()

        var body: some View {
            Form {
                Text("Observable Demo")
                    .font(.title)

                ReadOnlySubView(counter: counter, model: model)

                // @Bindable 에 넘길 때 $ 를 붙이지 않는다.
                ReadWriteSubView(counter: $counter, model: model)
            }
            .formStyle(.grouped)
        }
    }

    struct ReadOnlySubView: View {
        var counter: Int

        let model: Model

        @Environment(Model.self) private var envModel

        var body: some View {
            Section {
                Text("ReadOnly SubView")
                    .font(.headline)
                    .padding(4)
                LabeledContent("counter") {
                    Text("\(counter)")
                }
                LabeledContent("model.counter") {
                    Text("\(model.counter)")
                }
                LabeledContent("environment model.counter") {
                    Text("\(envModel.counter)")
                }
                LabeledContent("global model.counter") {
                    Text("\(GlobalModel.shared.counter)")
                }
            }
        }
    }

    struct ReadWriteSubView: View {
        @Binding var counter: Int

        // 서브 뷰로 바인딩이 필요하면 @Binging 대신 @Bindable 을 쓴다.
        @Bindable var model: Model
        
        @Environment(Model.self) private var envModel

        var body: some View {
            Section {
                Text("ReadWrite SubView")
                    .font(.headline)
                    .padding(4)
                LabeledContent("counter") {
                    Button("Increment") {
                        counter += 1
                    }
                }
                LabeledContent("model.counter") {
                    Button("Increment") {
                        model.counter += 1
                    }
                }
                LabeledContent("environment model.counter") {
                    Button("Increment") {
                        envModel.counter += 1
                    }
                }
                LabeledContent("global model.counter") {
                    Button("Increment") {
                        GlobalModel.shared.counter += 1
                    }
                }
            }
        }
    }

}

#Preview {
    ObservableDemo()
}
