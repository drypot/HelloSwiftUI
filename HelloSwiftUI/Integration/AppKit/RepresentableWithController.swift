//
//  RepresentableWithController.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/23/24.
//

import SwiftUI
import AppKit

struct RepresentableWithController: NSViewRepresentable {

    // SwiftUI 와의 데이터 소통 창구
    @Binding var text: String

    func makeNSView(context: Context) -> NSView {
        let coordinator = context.coordinator
        coordinator.loadView()
        return coordinator.view
    }

    // SwiftUI 데이터를 AppKit 데이터로.
    func updateNSView(_ nsView: NSView, context: Context) {
        guard let textView = nsView.subviews.first as? NSTextView else { fatalError() }
        textView.string = text
    }

    // Implement this method if changes to your view might affect other parts of your app.
    func makeCoordinator() -> Coordinator {

        // Coordinator 가 필요한 이유들.

        // AppKit 은 delegate pattern 을 많이 사용한다.
        // coordinator 를 delegate 로 쓰면 된다.

        // UI 코드와 로직을 분리하는 용도로 써도 된다.

        // AppKit 과 SwiftUI 간 커뮤니케이션에 사용한다.

        Coordinator(text: $text)
    }

    @MainActor
    class Coordinator: NSViewController, NSTextViewDelegate {
        var text: Binding<String>

        init(text: Binding<String>) {
            self.text = text
            super.init(nibName: nil, bundle: nil)
        }

        override func loadView() {
            let container = NSView()

            let textView = NSTextView()
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.delegate = self

            container.addSubview(textView)

            NSLayoutConstraint.activate([
                textView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
                textView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
                textView.topAnchor.constraint(equalTo: container.topAnchor),
                textView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
            ])

            self.view = container
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // AppKit 데이터를 SwiftUI 데이터로.
        func textDidChange(_ notification: Notification) {
            guard let textView = notification.object as? NSTextView else { return }
            text.wrappedValue = textView.string
        }
    }

}

struct RepresentableWithControllerDemo: View {
    @State private var message = "Representable with Controller Demo"

    var body: some View {
        VStack {
            Text(message)
                .font(.title)
                .padding()

            RepresentableWithCoordinator(text: $message)
                .frame(width: 200, height: 80)
        }
        .padding()
    }
}

#Preview {
    RepresentableWithControllerDemo()
}
