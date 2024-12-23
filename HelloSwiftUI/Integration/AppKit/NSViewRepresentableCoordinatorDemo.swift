//
//  NSViewRepresentableCoordinatorDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/20/24.
//

import SwiftUI
import AppKit

@Observable fileprivate class Model {
    var message: String

    init(message: String) {
        self.message = message
    }
}

fileprivate struct Representable: NSViewRepresentable {

    // SwiftUI 와의 데이터 소통 창구
    let model: Model

    func makeNSView(context: Context) -> NSView {
        let container = NSView()

        let textView = NSTextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.delegate = context.coordinator

        container.addSubview(textView)

        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            textView.topAnchor.constraint(equalTo: container.topAnchor),
            textView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])

        return container
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        context.coordinator.updateNSView(nsView)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(host: self)
    }

    @MainActor
    class Coordinator: NSObject, NSTextViewDelegate {
        var host: Representable

        init(host: Representable) {
            self.host = host
        }

        // SwiftUI 데이터를 AppKit 으로.
        func updateNSView(_ nsView: NSView) {
            guard let textView = nsView.subviews.first as? NSTextView else { fatalError() }
            textView.string = host.model.message
        }

        // AppKit 데이터를 SwiftUI 로.
        func textDidChange(_ notification: Notification) {
            guard let textView = notification.object as? NSTextView else { return }
            host.model.message = textView.string
        }
    }

}

struct NSViewRepresentableCoordinatorDemo: View {
    @State private var model = Model(message: "hello")

    var body: some View {
        VStack {
            Text("NSViewRepresentable with Coordinator Demo")
                .font(.title)
                .padding()

            Text(model.message)
                .font(.title3)
                .padding()

            Representable(model: model)
                .frame(width: 200, height: 80)
        }
        .padding()
    }
}

#Preview {
    NSViewRepresentableCoordinatorDemo()
}
