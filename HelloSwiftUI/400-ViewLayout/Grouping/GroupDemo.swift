//
//  GroupDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/24/24.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/group
// 여러 뷰를 하나로 모아서 modifier 를 적용하는데 사용한다.

struct GroupDemo: View {
    var body: some View {
        Group {
            Text("SwiftUI")
            Text("Combine")
            Text("Swift System")
        }
        .font(.largeTitle)
    }
}

#Preview {
    GroupDemo()
}
