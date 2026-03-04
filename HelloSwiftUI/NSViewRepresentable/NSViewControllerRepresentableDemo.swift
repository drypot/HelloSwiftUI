//
//  NSViewControllerRepresentable.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/23/24.
//


import SwiftUI
import AppKit

struct NSViewControllerRepresentableDemo: View {

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

            Button("Reset") {
                message = "Hello"
            }
            .frame(width: 200, height: 80)
        }
        .padding()
    }
}

fileprivate struct CustomTextView: NSViewControllerRepresentable {

    @Binding var message: String

    func makeNSViewController(context: Context) -> Controller {

        // context 는 environmentValues 나 coordinator 를 받기 위해 필요하다.

        // NSViewRepresentable 은 struct 다.
        // AppKit 에서 콜할 수 없다.

        // AppKit 에서 보내는 이벤트는 모두 Coordinator 에서 받는다.
        // Coordinator 는 class 다.

        // 여기서는 Controller 를 내가 만들어서 간편하게 coordinator 를 바로 넘겨 데모를 만들었는데,
        // Controller 를 내가 손댈 수 없는 경우는 controller 의 delegate 등에 연결해야 한다.
        // 사용할 Controller 에 따라 임기응변으로 대응한다;

        return Controller(context.coordinator)
    }

    // SwiftUI -> AppKit
    func updateNSViewController(_ controller: Controller, context: Context) {
        controller.updateTextView(message)
    }

    class Controller: NSViewController, NSTextViewDelegate {

        var coordinator: Coordinator

        init(_ coordinator: Coordinator) {
            self.coordinator = coordinator
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func loadView() {
            let view = NSView()
            view.translatesAutoresizingMaskIntoConstraints = false

            let textView = NSTextView()
            textView.font = .preferredFont(forTextStyle: .title3)
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.delegate = coordinator // ***

            view.addSubview(textView)

            NSLayoutConstraint.activate([
                textView.topAnchor.constraint(equalTo: view.topAnchor),
                textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                textView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])

            self.view = view
        }

        func updateTextView(_ message: String) {
            guard let textView = self.view.subviews.first as? NSTextView else { fatalError() }
            textView.string = message
        }

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // AppKit -> SwiftUI
    class Coordinator: NSObject, NSTextViewDelegate {
        var parent: CustomTextView

        init(_ parent: CustomTextView) {
            self.parent = parent
        }

        func textDidChange(_ notification: Notification) {
            guard let textView = notification.object as? NSTextView else { return }
            parent.message = textView.string
        }
    }
    
}

#Preview {
    NSViewControllerRepresentableDemo()
}
