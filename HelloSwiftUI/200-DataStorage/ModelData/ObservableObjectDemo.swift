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
        @Published var name: String = ""
    }

    @State private var isPresented = true
    @StateObject private var environmentModel = Model()

    init() {
        // @StateObject 를 수작업으로 초기화할 수도 있다.
        // 단 이런저런 이유로 View instance 가 새로 만들어 지더라도
        // wrappedValue 로 넘어간 초기화용 autoclosure 는 맨 처음, 단 한번만 실행됨을 유의해야 한다.
        _environmentModel = StateObject(wrappedValue: Model())
    }
    
    var body: some View {
        VStack {
            Button("Toggle View") {
                isPresented.toggle()
            }
            .padding()

            if isPresented {
                BaseView()
                    .environmentObject(environmentModel)
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
                ReadWriteSubView(model: model)
            }
            .formStyle(.grouped)
        }
    }

    struct ReadOnlySubView: View {
        // read-only 로 쓴다고 해도 @ObservedObject 로 받아야 변경 사항이 업데이트 된다.
        @ObservedObject var model: Model
        @EnvironmentObject var environmentModel: Model

        var body: some View {
            Section {
                Text("ReadOnly View")
                    .font(.headline)
                    .padding(4)
                LabeledContent("Counter") {
                    Text("\(model.counter)")
                }
                LabeledContent("Environment Counter") {
                    Text("\(environmentModel.counter)")
                }
                LabeledContent("Name") {
                    Text(model.name.isEmpty ? "---" : model.name)
                }
            }
        }
    }

    struct ReadWriteSubView: View {
        @ObservedObject var model: Model
        @EnvironmentObject var environmentModel: Model

        var body: some View {
            Section {
                Text("ReadWrite View")
                    .font(.headline)
                    .padding(4)
                LabeledContent("Counter") {
                    Button("Increment") {
                        model.counter += 1
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
