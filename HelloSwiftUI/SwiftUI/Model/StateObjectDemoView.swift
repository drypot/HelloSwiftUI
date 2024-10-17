//
//  StateObjectDemoView.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/17/24.
//

import SwiftUI

struct StateObjectDemoView: View {

    class Model: ObservableObject {
        @Published var counter = 0
        @Published var name: String = ""
    }

    @StateObject private var model = Model()

    @State private var counter = 0
    @State private var name: String = ""

    var body: some View {
        VStack {

            // State

            GroupBox {
                Text("State")
                    .font(.title3)
                    .padding(4)

                VStack {
                    Button("Increment") {
                        counter += 1
                    }
                    Text("\(counter)")

                    TextField("name", text: $name)
                        .textFieldStyle(.roundedBorder)
                    Text(name.isEmpty ? "---" : name)
                }
                .padding(4)
            }

            BindingSubView(counter: $counter, name: $name)

            // StateObject

            GroupBox {
                Text("StateObject")
                    .font(.title3)
                    .padding(4)

                VStack {
                    Button("Increment") {
                        model.counter += 1
                    }
                    Text("\(model.counter)")

                    TextField("name", text: $model.name)
                        .textFieldStyle(.roundedBorder)
                    Text(model.name.isEmpty ? "---" : model.name)
                }
                .padding(4)
            }

            ObservedSubView(model: model)
        }
        .frame(minWidth: 330, minHeight: 650, alignment: .top)
        .padding()
    }

    struct BindingSubView: View {
        @Binding var counter: Int
        @Binding var name: String

        var body: some View {
            GroupBox {
                Text("Binding SubView")
                    .font(.title3)
                    .padding(4)

                VStack {
                    Button("Increment") {
                        counter += 1
                    }
                    Text("\(counter)")

                    TextField("name", text: $name)
                        .textFieldStyle(.roundedBorder)
                    Text(name.isEmpty ? "---" : name)
                }
                .padding(4)
            }
        }
    }

    struct ObservedSubView: View {
        @ObservedObject var model: Model

        var body: some View {
            GroupBox {
                Text("ObservedObject SubView")
                    .font(.title3)
                    .padding(4)

                VStack {
                    Button("Increment") {
                        model.counter += 1
                    }
                    Text("\(model.counter)")

                    TextField("name", text: $model.name)
                        .textFieldStyle(.roundedBorder)
                    Text(model.name.isEmpty ? "---" : model.name)
                }
                .padding(4)
            }
        }
    }
}

#Preview {
    StateObjectDemoView()
}
