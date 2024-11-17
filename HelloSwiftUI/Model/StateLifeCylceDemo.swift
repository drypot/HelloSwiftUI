//
//  StateLifeCylceDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/17/24.
//

import SwiftUI

// SubView 를 없앴다 다시 만들면 State 도 리셋됨을 확인한다.

struct StateLifeCylceDemo: View {

    @State var showSub2 = true

    var body: some View {
        VStack {
            HStack {
                SubView(name: "Sub 1")
                if showSub2 {
                    SubView(name: "Sub 2")
                }
            }
            Button("toggle Sub 2") {
                showSub2.toggle()
            }
        }
    }

    struct SubView: View {

        let name: String
        @State var counter = 0

        var body: some View {
            ZStack {
                Rectangle()
                    .fill(.separator)
                    .frame(width: 200, height: 200)
                    .cornerRadius(10)

                VStack {
                    Text("\(name): \(counter)")
                    Button("increase") {
                        counter += 1
                    }
                }
            }
        }
    }

}

#Preview {
    StateLifeCylceDemo()
}
