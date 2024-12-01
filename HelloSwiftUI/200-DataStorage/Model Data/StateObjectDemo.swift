//
//  StateObjectDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/17/24.
//

import SwiftUI

struct StateObjectDemo: View {

    class Model: ObservableObject {
        @Published var counter = 0
        @Published var name: String = ""
    }

    @StateObject private var model = Model()

    

    var body: some View {
        VStack {

            

            // StateObject

            GroupBox {
                Text("StateObject")
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

            ObservedSubView(model: model)
        }
        .frame(minWidth: 330, maxWidth: 400, minHeight: 650, maxHeight: .infinity, alignment: .top)
        .padding()
    }

    

    struct ObservedSubView: View {
        @ObservedObject var model: Model

        var body: some View {
            GroupBox {
                Text("ObservedObject SubView")
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
