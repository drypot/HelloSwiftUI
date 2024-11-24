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

fileprivate func assertMainThreadSync() {
    print("assert main thread sync")
    assert(Thread.isMainThread)
}

fileprivate func assertBackgroundThreadSync() {
    print("assert background thread sync")
    assert(!Thread.isMainThread)
}

fileprivate func assertMainThreadAsync() async {
    print("assert main thread async")
    assert(Thread.isMainThread)
}

fileprivate func assertBackgroundThreadAsync() async {
    print("assert background thread async")
    assert(!Thread.isMainThread)
}

struct TaskDemo: View {

    var body: some View {
        VStack(spacing:8) {

            Button("Button action runs on main") {
                // Button action 선언에 @MainActor 가 붙어있다.
                assertMainThreadSync()
            }

            Button("Button action Task runs on main") {
                Task {
                    // Task 는 actor context 를 계승한다.
                    assertMainThreadSync()
                }
            }

            Button("Button action Task sub func Task runs on background") {
                Task {
                    func sub() {
                        Task {
                            // 펑션은 actor context 를 계승하지 않는다.
                            assertBackgroundThreadSync()
                        }
                    }
                    sub()
                }
            }

            Button("Button action Task await runs on background") {
                Task {
                    // Task 는 콜러의 actor context 를 계승 하지만.
                    assertMainThreadSync()
                    // await 은 백그라운드 스레드로 코드를 실행시킨다.
                    await assertBackgroundThreadAsync()
                }
            }

        }
    }
}

#Preview {
    TaskDemo()
}
