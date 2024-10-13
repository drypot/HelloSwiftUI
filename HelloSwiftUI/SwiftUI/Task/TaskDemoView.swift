//
//  TaskTestView.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 6/6/24.
//

import SwiftUI

struct TaskDemoView: View {

    @State private var counter = Counter()

    var body: some View {
        VStack {
            Button("Task Test") {
                print(counter.increment())
                Task {
                    onMainActor("a") // need not await
                    await someAsync()
                    onMainActor("b")
                }
                onMainActor("c")
            }
        }
        .padding()
    }
}

fileprivate struct Counter {
    var counter = 0

    mutating func increment() -> Int {
        let previous = counter
        counter += 1
        return previous
    }
}

@MainActor
fileprivate func onMainActor(_ mark: String) {
    print("on main \(mark)")
}

fileprivate func someAsync() async {
    print("on some async")
    await onMainActor("s") // use await
}

#Preview {
    TaskDemoView()
}
