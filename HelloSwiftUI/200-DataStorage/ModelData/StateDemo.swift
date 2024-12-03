//
//  StateDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/17/24.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/state

struct StateDemo: View {

    // @State 들은 private 으로 선언해서 실수로 memberwise initializer 들이 뷰 생성마다 초기화 하는 것을 방지한다.

    @State private var isPresented = true

    var body: some View {
        VStack {

            // View 를 날렸다 다시 만들면 @State data 가 초기화 됨을 확인한다.

            Button("Toggle View") {
                isPresented.toggle()
            }
            .padding()

            if isPresented {
                BaseView()
            } else {
                Spacer()
            }
        }
    }

    struct BaseView: View {
        @State private var counter = 0
        @State private var name: String = ""

        var body: some View {
            Form {
                Text("State Demo")
                    .font(.title)
                ReadOnlySubView(counter: counter, name: name)
                ReadWriteSubView(counter: $counter, name: $name)
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

    struct ReadWriteSubView: View {
        @Binding var counter: Int
        @Binding var name: String

        var body: some View {
            Section {
                Text("ReadWrite View")
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
