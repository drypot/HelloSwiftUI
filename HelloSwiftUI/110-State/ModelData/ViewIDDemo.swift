//
//  ViewIDDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/3/24.
//

import SwiftUI

struct ViewIDDemo: View {

    @State var value = 0

    var body: some View {
        Form {

            // SubView 에 넘기는 인자 value 를 업데이트해도 SubView 인스턴스가 새로 만들어 지지만
            // 새로운 id 를 넣어도 새로 만들어 진다.

            SubView(value: 10).id(value)
            Button("Increase Value") {
                value += 1
            }
        }
        .formStyle(.grouped)
    }

    struct SubView: View {
        let value: Int

        init(value: Int) {
            self.value = value
            print("Sub view created: \(value)")
        }

        var body: some View {
            Text("Sub View: \(value)")
        }
    }
}

#Preview {
    ViewIDDemo()
}
