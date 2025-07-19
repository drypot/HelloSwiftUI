//
//  NSViewRepresentableDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/20/24.
//

import SwiftUI
import AppKit

struct NSViewRepresentableDemo: View {

    @State private var dayOrNight = true

    var body: some View {
        VStack {
            Image(systemName: dayOrNight ? "sun.max" : "moon.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()

            // CustomButton 초기화 할때 클로져를 붙이는데
            // 이게 첫번째 프로퍼티인 onButtonClick 에 대입된다.

            CustomView {
                dayOrNight.toggle()
            }
            .frame(width: 200, height: 80)
        }
        .padding()
    }
}

fileprivate struct CustomView: NSViewRepresentable {

    var onButtonClick: () -> Void

    func makeNSView(context: Context) -> NSView {

        // context 는 environmentValues 나 coordinator 를 받기 위해 필요하다.

        let view = NSView()
        view.translatesAutoresizingMaskIntoConstraints = false

        let button = NSButton(
            title: "Click Me",
            target: context.coordinator,
            action: #selector(Coordinator.buttonClicked)
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bezelStyle = .rounded
        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])

        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {
    }

    func makeCoordinator() -> Coordinator {

        // Creates the custom Coordinator instance
        // to communicate changes from your view
        // to other parts of your SwiftUI interface.

        // NSViewRepresentable 은 struct 다.
        // 잠깐 만들어졌다 파괴된다.
        // AppKit Object 기반 코드에서 불러쓸 수 없다.

        // Coordinator 는 class 다.
        // NSView 에서 이벤트를 전달할 수 있다.
        // Delegate 로 쓸 수도 있다.

        // UI 코드와 로직을 분리하는 용도로 써도 된다.

        Coordinator(host: self)
    }

    @MainActor
    class Coordinator: NSObject {
        var host: CustomView

        init(host: CustomView) {
            self.host = host
        }

        @objc func buttonClicked() {
            host.onButtonClick()
        }
    }

}

#Preview {
    NSViewRepresentableDemo()
}
