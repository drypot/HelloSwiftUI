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
        return Controller(host: self)
    }

    func updateNSViewController(_ controller: Controller, context: Context) {
        controller.updateViews(host: self)
    }

    class Controller: NSViewController, NSTextViewDelegate {
        let host: CustomTextView

        init(host: CustomTextView) {
            self.host = host
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
            textView.delegate = self // Coordinator 없이 컨트롤러 스스로 이벤트를 핸들링

            view.addSubview(textView)

            NSLayoutConstraint.activate([
                textView.topAnchor.constraint(equalTo: view.topAnchor),
                textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                textView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])

            self.view = view
        }

        // SwiftUI 데이터를 AppKit 데이터로.
        func updateViews(host: CustomTextView) {

            // controller 초기화할 때 받아두었던 host 에는 당시 value 들이 저장되어 있다.
            // 업데이트된 value 들을 사용하려면 host 를 새로 받아야 한다.

            guard let textView = self.view.subviews.first as? NSTextView else { fatalError() }
            textView.string = host.message
        }

        // AppKit View 데이터를 SwiftUI 에 업데이트.
        func textDidChange(_ notification: Notification) {
            guard let textView = notification.object as? NSTextView else { return }
            host.message = textView.string
        }
    }

//    func makeCoordinator() -> Coordinator {
//        Coordinator(host: self)
//    }
//
//    class Coordinator: NSObject {
//        var host: CustomTextView
//
//        init(host: CustomTextView) {
//            self.host = host
//        }
//    }
    
}

#Preview {
    NSViewControllerRepresentableDemo()
}
