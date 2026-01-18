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

            Button("Call task") {
                Task {
                    assert(Thread.isMainThread)
                    await fetchData()
                    counter += 1
                }
            }

            Button("Call detached task") {
                Task.detached {
                    assert(!Thread.isMainThread)
                    await fetchData()
                    await MainActor.run {
                        counter += 1
                    }
                }
            }
        }
    }

    nonisolated func fetchData() async {
        print("fetchData: ...")
    }
}

#Preview {
    TaskDemo()
}
