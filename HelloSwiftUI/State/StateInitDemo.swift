//
//  StateInitDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/3/24.
//

import SwiftUI

struct StateInitDemo: View {

    @State var value = 10
    @State var id = 10

    var body: some View {
        Form {

            // View는 고유 식별자를 갖는다.
            // State는 View의 고유식별자에 연결된다.

            // 처음 View가 만들어질 때 State가 만들어진다.
            // 이후 View가 업데이트되어 새로 만들어져도 State는 새로 만들어지지 않는다.

            // SwiftUI 문서에 보면 State 는 선언과 동시에 초기화하라고 되어 있다.
            // init 에서 초기화하는 것은 권장되지 않는다.
            // View init 의 value 인자에 새로운 값을 전달해도 State 는 새로 만들어지지 않는다.

            // State를 정 새로 만들고 싶으면 뷰의 id 를 변경해야 한다.

            SubView(value: value).id(id)
            Button("Increase value") {
                value += 1
                print("value: \(value), id: \(id)")
            }
            Button("Increase id") {
                id += 1
                print("value: \(value), id: \(id)")
            }
        }
        .formStyle(.grouped)
    }

    struct SubView: View {
        @State var value: Int

        init(value: Int) {
            self.value = value  // 나중에 새로운 value가 들어와도 State가 새로 만들어지지 않는다.
            print("View created: \(self.value)")
        }

        var body: some View {
            // let _ = SomeView._printChanges()
            Text("value: \(value)")
        }
    }
}

#Preview {
    StateInitDemo()
}
