//
//  EnviromentDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/3/24.
//

import SwiftUI

struct EnvironmentDemo: View {

    @Observable
    class Model {
        var counter = 0
    }

    @State private var model = Model()

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("Enviroment Demo")
                .font(.title)

            VStack(alignment: .leading, spacing: 8) {
                Text("Demo")
                    .font(.title2)
                Text("counter: \(model.counter)")
                HStack {
                    Button("Increase counter") {
                        model.counter += 1
                    }
                }
            }

            EditView()
                .environment(model)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(32)
    }

    struct EditView: View {
        @Environment(Model.self) private var model

        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text("EditView")
                    .font(.title2)
                Text("parent counter: \(model.counter)")
                Button("Increase counter") {
                    model.counter += 1
                }
                do {
                    // @Environment 로 받은 변수는 $ 프로젝션을 제공하지 않는다.
                    // @Bindable을 수동으로 만들어줘야 한다.
                    @Bindable var model = model
                    Stepper(value: $model.counter) {
                        Text("Stepper")
                    }
                }
            }
        }
    }

}

#Preview {
    EnvironmentDemo()
}
