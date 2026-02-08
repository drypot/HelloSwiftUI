//
//  StateInitDemo2.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 01/26/26.
//

import SwiftUI
import Observation

// https://developer.apple.com/documentation/swiftui/state

struct StateInitDemo2: View {

    @Observable
    class Model {
        static var idSeed = 0

        var id: Int
        var counter = 0

        init() {
            Self.idSeed += 1
            id = Self.idSeed
            print("Model created: \(id)")
        }
    }

    @State private var counter = 0

    init() {
        //print("StateInitDemo2 created")
    }

    var body: some View {
        Form {
            Text("StateInitDemo2")
                .font(.title)
            Text("BaseView counter: \(counter)")
            Button("Increase BaseView counter") {
                // counter 를 변경하면 Demo의 body가 호출되서 화면이 업데이트된다.
                // Demo 가 새로 만들어지는 것은 아니다.
                counter += 1
            }
            // Demo의 body가 호출될 때마다 SubView는 새로 만들어진다.
            SubView()
        }
        .formStyle(.grouped)
    }

    struct SubView: View {
        // SubView가 새로 만들어질 때마다 Model이 새로 **자주** 만들어진다.
        // State에 넣을 object를 만들 때 부하 걸리지 않게 조심하라고 한다.
        @State var model = Model()

        init() {
            print("SubView created")
        }

        var body: some View {
            Text("SubView model: id: \(model.id), counter: \(model.counter)")
            Button("Increase Model counter") {
                // model.counter 를 변경하면 SubView의 body가 호출되서 화면이 업데이트된다.
                // SubView 가 새로 만들어지는 것은 아니다.
                model.counter += 1
            }
        }
    }

}

#Preview {
    StateInitDemo2()
}
