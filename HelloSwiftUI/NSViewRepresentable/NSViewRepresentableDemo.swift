//
//  NSViewRepresentableDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/20/24.
//


import SwiftUI
import AppKit

struct NSViewRepresentableDemo: View {

    @State private var message = "Hello"

    var body: some View {
        VStack {
            TextEditor(text: $message)
                .font(.title3)
                .frame(width: 200, height: 120)
                .border(Color.gray, width: 1)

            CustomTextView(message: $message)
                .frame(width: 200, height: 120)
                .border(Color.gray, width: 1)

            CustomButton("Reset") {
                message = "Hello"
            }
            .frame(width: 200, height: 80)
        }
        .padding()
    }
}

fileprivate struct CustomTextView: NSViewRepresentable {

    @Binding var message: String

    func makeCoordinator() -> Coordinator {
        print("makeCoordinator: CustomTextView")
        return Coordinator(self)
    }

    func makeNSView(context: Context) -> NSView {
        // context 는 environmentValues 나 coordinator 를 받기 위해 필요하다.

        // NSViewRepresentable 은 struct 라 AppKit 에서 콜할 수 없다.
        // AppKit 에서 보내는 이벤트는 모두 Coordinator class 에서 받는다.

        let view = NSView()
        view.translatesAutoresizingMaskIntoConstraints = false

        let textView = NSTextView()
        textView.font = .preferredFont(forTextStyle: .title3)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.delegate = context.coordinator // ***

        view.addSubview(textView)

        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        print("makeNSView: CustomTextView")
        return view
    }

    // SwiftUI 에서 AppKit 을 업데이트 하는 코드들은 updateNSView 에.

    func updateNSView(_ nsView: NSView, context: Context) {
        guard let textView = nsView.subviews.first as? NSTextView else { fatalError() }
        textView.string = message
        print("updateNSView: CustomTextView")
    }

    class Coordinator: NSObject, NSTextViewDelegate {
        var parent: CustomTextView

        init(_ parent: CustomTextView) {
            self.parent = parent
        }

        func textDidChange(_ notification: Notification) {
            guard let textView = notification.object as? NSTextView else { return }
            parent.message = textView.string
            print("textDidChange: Coordinator")
        }
    }

}

fileprivate struct CustomButton: NSViewRepresentable {
    var title: String
    var action: () -> Void

    init(_ title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    func makeNSView(context: Context) -> NSView {
        let view = NSView()
        view.translatesAutoresizingMaskIntoConstraints = false

        let button = NSButton(
            title: title,
            target: context.coordinator, // ***
            action: #selector(Coordinator.action) // ***
        )
        button.translatesAutoresizingMaskIntoConstraints = false
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
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: CustomButton

        init(_ parent: CustomButton) {
            self.parent = parent
        }

        @objc func action() {
            parent.action()
        }
    }

}

#Preview {
    NSViewRepresentableDemo()
}
