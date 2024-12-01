//
//  StateDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/17/24.
//

import SwiftUI

struct StateDemo: View {

    @State var showBase2 = true

    var body: some View {
        VStack {

            // View 를 날렸다 다시 만들면 @State data 가 초기화 됨을 확인한다.

            Button("Toggle View") {
                showBase2.toggle()
            }
            .padding()

            if showBase2 {
                BaseView()
            } else {
                Spacer()
            }
        }
    }

    struct BaseView: View {
        @State var counter = 0
        @State var name: String = ""

        var body: some View {
            Form {
                ReadOnlySubView(counter: counter, name: name)
                BindingSubView(counter: $counter, name: $name)
            }
            .formStyle(.grouped)
        }
    }

    struct ReadOnlySubView: View {
        var counter: Int
        var name: String

        var body: some View {
            Section {
                Text("ReadOnly View")
                    .font(.headline)
                    .padding(4)
                LabeledContent("Counter") {
                    Text("\(counter)")
                }
                LabeledContent("Name") {
                    Text(name.isEmpty ? "---" : name)
                }
            }
        }
    }

    struct BindingSubView: View {
        @Binding var counter: Int
        @Binding var name: String

        var body: some View {
            Section {
                Text("Binding View")
                    .font(.headline)
                    .padding(4)
                LabeledContent("Counter") {
                    Button("Increment") {
                        counter += 1
                    }
                }
                TextField("Name", text: $name)
                    .textFieldStyle(.roundedBorder)
            }
        }
    }

}

#Preview {
    StateDemo()
}
