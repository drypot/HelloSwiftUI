//
//  StateViewIDDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/3/24.
//

import SwiftUI

// View는 고유 식별자를 갖는다.
// State는 View의 고유식별자에 연결된다.

// View가 처음 만들어질 때 State가 만들어진다.
// View가 다시 만들어져도 State는 새로 만들어지지 않는다.

// State를 정 새로 만들고 싶으면 뷰의 id 를 변경해야 한다.

struct StateViewIDDemo: View {
    @State private var counter = 10
    @State private var editViewID = 10

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("State ViewID Demo")
                .font(.title)

            VStack(alignment: .leading, spacing: 8) {
                Text("Demo")
                    .font(.title2)
                Text("counter: \(counter), EditView id: \(editViewID)")
                HStack {
                    Button("Increase counter") {
                        counter += 1
                    }
                    Button("Increase EditView id") {
                        editViewID += 1
                    }
                }
            }

            EditView(parentCounter: $counter).id(editViewID)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(32)
    }

    struct EditView: View {
        @Binding var parentCounter: Int
        @State private var counter: Int = 10

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
    StateViewIDDemo()
}
