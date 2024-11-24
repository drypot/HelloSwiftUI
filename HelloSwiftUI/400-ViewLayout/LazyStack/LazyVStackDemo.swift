//
//  LazyVStackDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/24/24.
//

import SwiftUI

struct LazyVStackDemo: View {
    var body: some View {
        ScrollView {
            // 화면이 꽉 차면 ForEach 안의 클로져가 더이상 호출되지 않는다.
            // 스크롤로 화면을 이동하면 마저 호출된다.
            LazyVStack(alignment: .leading) {
                ForEach(1...100, id: \.self) {
                    // VStack + ForEach 조합은 크기 계산에 한번, 렌더링에 한번, 해서 두 번 호출된다;
                    // List + ForEach 는 한번만 호출되는 것 같다.
                    let _ = print($0)
                    Text("Row \($0)")
                }
            }
        }
        .padding()
    }
}

#Preview {
    LazyVStackDemo()
}
