//
//  NSViewRepresentableDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/20/24.
//


import SwiftUI
import AppKit

@Observable fileprivate class Model {
    var text: String

    init(text: String) {
        self.text = text
    }
}

struct NSViewRepresentableDemo: View {

    @State private var model = Model(text: "Hello")

    var body: some View {
        VStack {
            Text("\(model.text)")
                .font(.title3)
                .padding()
                .frame(width: 200, height: 120, alignment: .topLeading)
                .border(Color.gray, width: 1)

            CustomTextView(model: model)
                .frame(width: 200, height: 120)

            CustomButton("Reset") {
                model.text = "Hello"
            }
            .frame(width: 200, height: 80)
        }
        .padding()
    }
}

fileprivate struct CustomTextView: NSViewRepresentable {

    let model: Model

    func makeNSView(context: Context) -> NSView {

        // context 는 environmentValues 나 coordinator 를 받기 위해 필요하다.

        let view = NSView()
        view.translatesAutoresizingMaskIntoConstraints = false

        let textView = NSTextView()
        textView.font = .preferredFont(forTextStyle: .title3)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.delegate = context.coordinator // Coordinator 를 이벤트 핸들러로 지정

        view.addSubview(textView)

        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        return view
    }

    // SwiftUI 데이터를 AppKit View 에 업데이트.
    func updateNSView(_ nsView: NSView, context: Context) {
        guard let textView = nsView.subviews.first as? NSTextView else { fatalError() }
        textView.string = model.text
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
    class Coordinator: NSObject, NSTextViewDelegate {
        var host: CustomTextView

        init(host: CustomTextView) {
            self.host = host
        }

        // AppKit View 데이터를 SwiftUI 에 업데이트.
        func textDidChange(_ notification: Notification) {
            guard let textView = notification.object as? NSTextView else { return }
            host.model.text = textView.string
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
            target: context.coordinator,
            action: #selector(Coordinator.action)
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
        Coordinator(host: self)
    }

    @MainActor
    class Coordinator: NSObject {
        var host: CustomButton

        init(host: CustomButton) {
            self.host = host
        }

        @objc func action() {
            host.action()
        }
    }

}

#Preview {
    NSViewRepresentableDemo()
}
