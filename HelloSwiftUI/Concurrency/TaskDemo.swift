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

                // closure 들은 Actor 를 계승한다, View 의 MainActor 가 계승된다.

                Task {

                    // Task 도 Actor 를 계승한다, View 의 MainActor 가 계승된다.

                    await fetchData()
                    counter += 1
                }
            }

            Button("Call task fetchDataConcurrent") {
                Task {
                    // Task.detached 가 있기는 한데,
                    // Task.detached 대신,
                    // async 펑션에 @concurrent 붙이는 것이 원만하다.
                    await fetchDataConcurrent()
                    counter += 1
                }
            }

            Button("Call detached fetchData") {
                Task.detached {

                    // No actor isolation, runs on cooperative pool

                    await fetchData()
                    await MainActor.run {
                        counter += 1
                    }
                }
            }

            Button("Call detached fetchDataConcurrent") {
                Task.detached {

                    // No actor isolation, runs on cooperative pool

                    await fetchDataConcurrent()
                    await MainActor.run {
                        counter += 1
                    }
                }
            }

        }
    }

    // @MainActor 가 기본으로 붙으니 MainActor 에서 실행된다.
    func fetchData() async {
        assert(Thread.isMainThread)
        print("fetchData: ...")
    }

    // @concurrent 가 붙으면 Actor 바깥에서 실행된다.
    @concurrent func fetchDataConcurrent() async {
        assert(!Thread.isMainThread)
        print("fetchDataConcurrent: ...")
    }
}

#Preview {
    TaskDemo()
}
