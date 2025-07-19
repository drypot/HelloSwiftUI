//
//  NSViewRepresentableDemo2.swift
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

struct NSViewRepresentableDemo2: View {

    @State private var model = Model(message: "hello")

    var body: some View {
        VStack {
            Text("Output: \(model.message)")
                .font(.title3)
                .padding()

            CustomView(model: model)
                .frame(width: 200, height: 80)
        }
        .padding()
    }
}

fileprivate struct CustomView: NSViewRepresentable {

    // SwiftUI 와의 데이터 소통 창구
    let model: Model

    func makeNSView(context: Context) -> NSView {
        let view = NSView()
        view.translatesAutoresizingMaskIntoConstraints = false

        let textView = NSTextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.delegate = context.coordinator

        view.addSubview(textView)

        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        context.coordinator.updateNSView(nsView)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(host: self)
    }

    @MainActor
    class Coordinator: NSObject, NSTextViewDelegate {
        var host: CustomView

        init(host: CustomView) {
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

#Preview {
    NSViewRepresentableDemo2()
}
