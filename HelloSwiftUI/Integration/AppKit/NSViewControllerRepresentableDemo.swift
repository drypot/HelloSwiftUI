//
//  NSViewControllerRepresentable.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/23/24.
//

import SwiftUI
import AppKit

fileprivate struct Representable: NSViewControllerRepresentable {

    // SwiftUI 와의 데이터 소통 창구
    @Binding var text: String

    func makeNSViewController(context: Context) -> Controller {
        return Controller(text: $text)
    }

    func updateNSViewController(_ controller: Controller, context: Context) {
        controller.updateText()
    }

    class Controller: NSViewController, NSTextViewDelegate {
        var text: Binding<String>

        init(text: Binding<String>) {
            self.text = text
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
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

        // SwiftUI 데이터를 AppKit 데이터로.
        func updateText() {
            guard let textView = self.view.subviews.first as? NSTextView else { fatalError() }
            textView.textStorage?.beginEditing()
            print("aaa: \(text.wrappedValue)")
            textView.string = text.wrappedValue
            textView.textStorage?.endEditing()
        }

        // AppKit 데이터를 SwiftUI 데이터로.
        func textDidChange(_ notification: Notification) {
            guard let textView = notification.object as? NSTextView else { return }
            text.wrappedValue = textView.string
            print("bbb: \(text.wrappedValue)")
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    @MainActor
    class Coordinator: NSObject {
        var parent: Representable

        init(parent: Representable) {
            self.parent = parent
        }
    }
}

struct NSViewControllerRepresentableDemo: View {
    @State private var message = "hello"

    var body: some View {
        VStack {
            Text("NSViewControllerRepresentable Demo")
                .font(.title)
                .padding()

            Text(message)
                .font(.title3)
                .padding()

            Representable(text: $message)
                .frame(width: 200, height: 80)
        }
        .padding()
    }
}

#Preview {
    NSViewControllerRepresentableDemo()
}
