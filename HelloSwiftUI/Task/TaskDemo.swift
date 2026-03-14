//
//  TaskDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 6/6/24.
//

import SwiftUI

// https://developer.apple.com/tutorials/app-dev-training/adopting-swift-concurrency
// https://developer.apple.com/tutorials/app-dev-training/persisting-data

// https://forums.swift.org/t/determining-whether-an-async-function-will-run-on-the-main-actor/60749/12

// SwiftUI 코드는 main 스레드에서 동작하고 있다는 것이 확정 보장된다.

struct TaskDemo: View {

    @State var counter = 0

    var body: some View {
        VStack() {

            Text("Counter: \(counter)")

            Button("Call task fetchData") {
                // MainActor
                Task {
                    // MainActor. Task 는 Actor 를 계승한다.
                    await fetchDataAsync() // MainActor 에서 실행됨.
                    counter += 1
                }
            }

            Button("Call task fetchDataConcurrent") {
                // MainActor
                Task {
                    // MainActor
                    await fetchDataConcurrent() // Background 에서 실행됨.
                    counter += 1
                }
            }
        }
    }

    // MainActor
    func fetchDataAsync() async {
        // MainActor
        assert(Thread.isMainThread)
        print("fetchData: ...")
    }

    // Background. 예전엔 Task.detached 로 비슷한 효과를 냈었다.
    @concurrent
    func fetchDataConcurrent() async {
        assert(!Thread.isMainThread)
        print("fetchDataConcurrent: ...")
    }
}

#Preview {
    TaskDemo()
}
