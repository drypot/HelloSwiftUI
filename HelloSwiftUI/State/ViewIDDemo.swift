//
//  ViewIDDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/3/24.
//

import SwiftUI

struct ViewIDDemo: View {

    @State var value = 10
    @State var id = 10

    var body: some View {
        Form {

            // View는 고유 식별자와 연결해서 State 저장소를 관리한다.
            // 첫 SubView가 만들어질 때 State도 만들어지고 그 이후에는 새로 만들어지지 않는다.
            // SubView init 의 value 인자에 새로운 값을 전달해도 State 는 새로 만들어지지 않는다.
            // 정 새로 만들고 싶으면 뷰의 id 를 변경해야 한다.

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
            self.value = value
            print("SubView created: \(self.value)")
        }

        var body: some View {
            let _ = Self._printChanges()
            Text("SubView: \(value)")
        }
    }
}

#Preview {
    ViewIDDemo()
}
