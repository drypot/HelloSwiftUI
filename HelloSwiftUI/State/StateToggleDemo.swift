//
//  StateToggleDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/17/25.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/state

struct StateToggleDemo: View {

    // isPresented 를 toggle 하면 EditView 가 새로 생성되거나 삭제된다.
    // EditView 가 새로 생성될 때 SubView State도 초기화 됨을 확인한다.

    @State private var counter = 10
    @State private var isPresented = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("State Toggle Demo")
                .font(.title)

            VStack(alignment: .leading, spacing: 8) {
                Text("Demo")
                    .font(.title2)
                Text("counter: \(counter)")
                HStack {
                    Button("Increase counter") {
                        counter += 1
                    }
                }
                Button("Toggle EditView") {
                    isPresented.toggle()
                }
            }

            if isPresented {
                EditView(parentCounter: $counter)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(32)
    }

    struct EditView: View {
        @Binding var parentCounter: Int
        @State var counter: Int = 10

        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text("EditView")
                    .font(.title2)
                Text("parentCounter: \(parentCounter), counter: \(counter)")
                Button("Increase parent counter") {
                    parentCounter += 1
                }
                Button("Increase counter") {
                    counter += 1
                }
            }
        }
    }

}

#Preview {
    StateToggleDemo()
}
