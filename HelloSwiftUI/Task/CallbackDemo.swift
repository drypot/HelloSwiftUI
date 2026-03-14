//
//  CallbackDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 1/18/26.
//

import SwiftUI

struct CallbackDemo: View {

    @State var counter = 0

    var body: some View {
        VStack() {

            Text("Counter: \(counter)")

            Button("Call main async") {
                DispatchQueue.global().async {

                    // 무엇인가 백그라운드 작업 ...

                    DispatchQueue.main.async {
                        // 백그라운드 작업 끝나면 main thread 에서 결과를 보고 한다.
                        assert(Thread.isMainThread)
                        counter += 1
                    }
                }
            }
        }
    }
}

#Preview {
    CallbackDemo()
}
