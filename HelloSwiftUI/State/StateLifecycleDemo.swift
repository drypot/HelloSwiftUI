//
//  StateLifecycleDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/17/25.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/state

struct StateLifecycleDemo: View {

    // isPresented 를 toggle 하면 SubView 가 새로 생성되거나 삭제된다.
    // SubView 가 새로 생성될 때 SubView @State 들도 초기화 됨을 확인한다.

    @State private var isPresented = true
    
    var body: some View {
        Form {
            Text("State Lifecycle Demo")
                .font(.title)

            Button("Toggle SubView") {
                isPresented.toggle()
            }

            if isPresented {
                SubView()
            }
        }
        .formStyle(.grouped)
    }

    struct SubView: View {
        @State private var counter = 0

        var body: some View {
            Section {
                Text("Sub View")
                    .font(.title2)
                    .padding(4)

                LabeledContent("Counter") {
                    Stepper(value: $counter) {
                        Text("\(counter)")
                    }
                }
            }
        }

    }

}

#Preview {
    StateLifecycleDemo()
}
