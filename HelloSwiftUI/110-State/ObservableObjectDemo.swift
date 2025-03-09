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

    @State private var isPresented = true
    @StateObject private var envModel = Model()

    init() {
        // @StateObject 를 수작업으로 초기화할 수도 있다.
        // 단 이런저런 이유로 View instance 가 새로 만들어 지더라도
        // wrappedValue 로 넘어간 초기화용 autoclosure 는 맨 처음, 단 한번만 실행됨을 유의해야 한다.
        _envModel = StateObject(wrappedValue: Model())
    }
    
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
                    .environmentObject(envModel)
            } else {
                Spacer()
            }
        }
    }

    struct BaseView: View {
        @State private var counter = 0

        // ObservableObject 를 관리하기 위해선 @State 가 아닌 @StateObject 를 쓴다.
        @StateObject private var model = Model()

        var body: some View {
            Form {
                Text("ObservableObject Demo")
                    .font(.title)

                ReadOnlySubView(counter: counter, model: model)

                // @ObservedObject 에 넘길 때 $ 를 붙이지 않는다.
                ReadWriteSubView(counter: $counter, model: model)
            }
            .formStyle(.grouped)
        }
    }

    struct ReadOnlySubView: View {
        var counter: Int

        // read-only 로 쓴다고 해도 @ObservedObject 로 받아야 변경 사항이 업데이트 된다.
        @ObservedObject var model: Model

        @EnvironmentObject var envModel: Model

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
            }
        }
    }

    struct ReadWriteSubView: View {
        @Binding var counter: Int

        @ObservedObject var model: Model

        @EnvironmentObject var envModel: Model

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
            }
        }
    }

}

#Preview {
    ObservableObjectDemo()
}
