//
//  NSViewRepresentableDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/20/24.
//

import SwiftUI
import AppKit

fileprivate struct Representable: NSViewRepresentable {

    // NSButtonView 초기화 할때 클로져를 붙이는데
    // 이게 struct 첫번째 변수인 onButtonClick 에 대입된다.
    
    var onButtonClick: () -> Void

    func makeNSView(context: Context) -> NSView {

        // context 는 environmentValues 나 coordinator 를 받기 위해 필요하다.

        let container = NSView()

        let button = NSButton(
            title: "Click Me",
            target: context.coordinator,
            action: #selector(Coordinator.buttonClicked)
        )
        button.bezelStyle = .rounded
        button.frame = NSRect(x: 50, y: 20, width: 100, height: 40)
        container.addSubview(button)

        return container
    }

    func updateNSView(_ nsView: NSView, context: Context) {
    }

    func makeCoordinator() -> Coordinator {

        // Coordinator 가 필요한 이유들.

        // AppKit 은 delegate pattern 을 많이 사용한다.
        // coordinator 를 delegate 로 쓰면 된다.

        // UI 코드와 로직을 분리하는 용도로 써도 된다.

        // AppKit 과 SwiftUI 간 커뮤니케이션에 사용한다.

        Coordinator(parent: self)
    }

    @MainActor
    class Coordinator: NSObject {
        var parent: Representable

        init(parent: Representable) {
            self.parent = parent
        }

        @objc func buttonClicked() {
            parent.onButtonClick()
        }
    }

}

struct NSViewRepresentableDemo: View {
    @State private var dayOrNight = true

    var body: some View {
        VStack {
            Image(systemName: dayOrNight ? "sun.max" : "moon.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()

            Representable {
                dayOrNight.toggle()
            }
            .frame(width: 200, height: 80)
        }
        .padding()
    }
}

#Preview {
    NSViewRepresentableDemo()
}
