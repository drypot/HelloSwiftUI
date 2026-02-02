//
//  StateInitDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/3/24.
//

import SwiftUI

// View는 고유 식별자를 갖는다.
// State는 View의 고유식별자에 연결된다.

// View가 처음 만들어질 때 State가 만들어진다.
// View가 다시 만들어져도 State는 새로 만들어지지 않는다.
// View init 인자에 새로운 값을 전달해도 State 는 새로 만들어지지 않는다.

// State 는 선언과 동시에 초기화하는 것이 권장된다.
// init 에서 초기화는 권장되지 않는다.

// State를 정 새로 만들고 싶으면 뷰의 id 를 변경해야 한다.

// 복잡한데, 정리하자면,
// struct Custom View 를 만들어 쓸 때,
// 데이터 관리가 필요하면 @State 프로퍼티,
// 일반 프로퍼티는 인자를 받는 용도로만,
// 프로퍼티가 바뀔 때 init 가 되는지 안 되는지까지 생각하려면 머리가 아파진다,
// 그러니 init 는 가능하면 쓰지 말고,
// 프로퍼티가 바뀌면 body 가 콜된다고 생각하면 될 듯하다.

struct StateInitDemo: View {

    @State var value = 10
    @State var id = 10

    init() {
        print("Demo init.")
    }

    var body: some View {
        var _ = print("Demo body, value: \(value), id: \(id).")
        Form {
            Text("Demo, value: \(value), id: \(id)")
            Button("Increase value") {
                value += 1
            }
            Button("Increase id") {
                id += 1
            }
            SubView(value: value).id(id)
        }
        .formStyle(.grouped)
    }

    struct SubView: View {
        @State var value: Int

        init(value: Int) {
            // 새로운 value가 들어와도 State가 새로 만들어지지 않는다.
            // 엄밀히 기술하면 init 내부에서는 새로운 value가 사용되지만
            // body 에서는 State 에 저장되어 있던 value가 다시 등장한다.
            self.value = value
            print("SubView init, value: \(self.value)")
        }

        var body: some View {
            var _ = print("SubView body, value: \(value).")
            Text("SubView, value: \(value)")
            Button("Increase SubView value") {
                value += 1
            }
        }
    }
}

#Preview {
    StateInitDemo()
}
