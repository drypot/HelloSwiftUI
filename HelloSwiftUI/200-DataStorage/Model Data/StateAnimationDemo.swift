//
//  StateAnimationDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/2/24.
//

import SwiftUI

struct StateAnimationDemo: View {

    @State var isPlaying = false

    var body: some View {
        Button("Toggle") {

            // withAnimation 안에서 변경되는 값에 영향받는 모든 View 변화가 애니메이션 된다.

            withAnimation(.easeInOut(duration: 1)) {
                isPlaying.toggle()
            }
        }
        Image(systemName: isPlaying ? "pause.circle" : "play.circle")
            .font(.largeTitle)
            .scaleEffect(isPlaying ? 1 : 1.5)
            .padding()
    }
}

#Preview {
    StateAnimationDemo()
}
