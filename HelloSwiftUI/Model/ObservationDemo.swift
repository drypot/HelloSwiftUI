//
//  ObservationDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/19/24.
//

import SwiftUI

// https://developer.apple.com/documentation/observation
// https://developer.apple.com/documentation/swiftui/managing-model-data-in-your-app
// https://developer.apple.com/documentation/swiftui/migrating-from-the-observable-object-protocol-to-the-observable-macro

struct ObservationDemo: View {

    // @Observable
    @Observable class Model {
        var counter = 0
        var name: String = ""
    }

    // @State 는 @Observable 과 상관없다.
    // @State 는 데이터 소스를 만들기 위해 쓰는데 보통 결국 쓰긴 해야 할 듯.
    @State var model = Model()

    var body: some View {
        VStack {
            GroupBox {
                Text("Main View")
                    .font(.title3)
                    .padding(4)

                VStack {
                    Text("\(model.counter)")
                    Button("Increment") {
                        model.counter += 1
                    }

                    Text(model.name.isEmpty ? "---" : model.name)
                    TextField("name", text: $model.name)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(4)
            }

            SubView(model: model)
        }
        .frame(minWidth: 330, maxWidth: 400, minHeight: 650, maxHeight: .infinity, alignment: .top)
        .padding()
    }


    struct SubView: View {
        // model 프로퍼티를 읽기만 한다면 @Bindable 필요 없는데
        // TextField 에서 넘길 바인딩을 만들어야 해서 @Bindable 붙여 준다.
        @Bindable var model: Model

        var body: some View {
            GroupBox {
                Text("Sub View")
                    .font(.title3)
                    .padding(4)

                VStack {
                    Text("\(model.counter)")
                    Button("Increment") {
                        model.counter += 1
                    }

                    Text(model.name.isEmpty ? "---" : model.name)
                    TextField("name", text: $model.name)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(4)
            }
        }
    }
}

#Preview {
    StateObjectDemo()
}
