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

    @StateObject private var envObject = Model()

    init() {
        // @StateObject 를 수작업으로 초기화할 수도 있다.
        // 단 이런저런 이유로 View instance 가 새로 만들어 지더라도
        // wrappedValue 로 넘어간 초기화용 autoclosure 는 맨 처음, 단 한번만 실행됨을 유의해야 한다.
        _envObject = StateObject(wrappedValue: Model())
    }
    
    var body: some View {
        Form {
            Text("ObservableObject Demo")
                .font(.title)

            ParentView()
                .environmentObject(envObject)
        }
        .formStyle(.grouped)
    }

    struct ParentView: View {
        @State private var counter = 0

        // ObservableObject 를 관리하기 위해선 @State 가 아닌 @StateObject 를 쓴다.
        @StateObject private var object = Model()

        @EnvironmentObject var envObject: Model

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
                LabeledContent("environment object") {
                    Stepper(value: $envObject.counter) {
                        Text("\(envObject.counter)")
                    }
                }

                ReadOnlySubView(counter: counter, object: object)

                // @ObservedObject 에 넘길 때 $ 를 붙이지 않는다.
                ReadWriteSubView(counter: $counter, object: object)
            }
            .formStyle(.grouped)
        }
    }

    struct ReadOnlySubView: View {
        var counter: Int

        // read-only 로 쓴다고 해도 @ObservedObject 로 받아야 변경 사항이 업데이트 된다.
        @ObservedObject var object: Model

        @EnvironmentObject var envObject: Model

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
            }
        }
    }

    struct ReadWriteSubView: View {
        @Binding var counter: Int

        @ObservedObject var object: Model

        @EnvironmentObject var envObject: Model

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
                LabeledContent("environment object") {
                    Stepper(value: $envObject.counter) {
                        Text("\(envObject.counter)")
                    }
                }
            }
        }
    }

}

#Preview {
    ObservableObjectDemo()
}
