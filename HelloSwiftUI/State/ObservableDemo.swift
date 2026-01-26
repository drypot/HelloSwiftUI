//
//  ObservableDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/17/24.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/state

struct ObservableDemo: View {

    // 다음과 같은 구조.
    // ObservableDemo -> ParentView -> ReadOnlySubView | ReadWriteSubView

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

    @State private var envObject = Model()

    var body: some View {
        Form {
            Text("Observable Demo")
                .font(.title)

            BaseView()
                .environment(envObject)
        }
        .formStyle(.grouped)
    }

    struct BaseView: View {
        @State private var counter = 0

        // @Observable 저장에는 @StateObject 대신 걍 @State 를 쓴다.
        // object 는 @Observable 이기 때문에 프로퍼티 변경시 View 가 인지한다.
        @State private var object = Model()

        // envObject 는 @Observable 이기 때문에 프로퍼티 변경시 View 가 인지한다.
        @Environment(Model.self) private var envObject

        // Model.shared 는 @Observable 이기 때문에 프로퍼티 변경시 View 가 인지한다.
        private var globalObject = Model.shared

        var body: some View {
            Section {
                Text("Parent View")
                    .font(.headline)
                    .padding(4)
                LabeledContent("local counter") {
                    Stepper(value: $counter) {
                        Text("\(counter)")
                    }
                }
                LabeledContent("local object") {
                    Stepper(value: $object.counter) {
                        Text("\(object.counter)")
                    }
                }
                // $ 프로젝션을 제공받지 못하는 경우엔 Bindable을 수동으로 만들어줘야 한다.
                LabeledContent("environment object") {
                    @Bindable var envObject = envObject
                    Stepper(value: $envObject.counter) {
                        Text("\(envObject.counter)")
                    }
                }
                LabeledContent("global object") {
                    @Bindable var globalObject = globalObject
                    Stepper(value: $globalObject.counter) {
                        Text("\(globalObject.counter)")
                    }
                }
            }

            ReadOnlySubView(counter: counter, object: object)

            // @Bindable 에 넘길 때 $ 를 붙이지 않는다.
            ReadWriteSubView(counter: $counter, object: object)
        }
    }

    struct ReadOnlySubView: View {
        var counter: Int
        let object: Model
        @Environment(Model.self) private var envObject
        private let globalObject = Model.shared

        var body: some View {
            Section {
                Text("ReadOnly SubView")
                    .font(.headline)
                    .padding(4)
                LabeledContent("parent counter") {
                    Text("\(counter)")
                }
                LabeledContent("parent object") {
                    Text("\(object.counter)")
                }
                LabeledContent("environment object") {
                    Text("\(envObject.counter)")
                }
                LabeledContent("global object") {
                    Text("\(globalObject.counter)")
                }
            }
        }
    }

    struct ReadWriteSubView: View {
        // @State 에 대한 바인딩이 필요하면 @Binding 으로 받는다.
        @Binding var counter: Int

        // @Observable @State 에 대한 바인딩이 필요하면 @Binging 대신 @Bindable 로 받는다.
        @Bindable var object: Model

        @Environment(Model.self) private var envObject

        private let globalObject = Model.shared

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
                LabeledContent("parent object") {
                    Stepper(value: $object.counter) {
                        Text("\(object.counter)")
                    }
                }
                // $ 프로젝션을 제공받지 못하는 경우엔 Bindable을 수동으로 만들어줘야 한다.
                LabeledContent("environment object") {
                    @Bindable var envObject = envObject
                    Stepper(value: $envObject.counter) {
                        Text("\(envObject.counter)")
                    }
                }
                LabeledContent("global object") {
                    @Bindable var globalObject = globalObject
                    Stepper(value: $globalObject.counter) {
                        Text("\(globalObject.counter)")
                    }
                }
            }
        }
    }

}

#Preview {
    ObservableDemo()
}
