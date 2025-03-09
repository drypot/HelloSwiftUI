//
//  NSViewControllerRepresentable.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/23/24.
//

import SwiftUI
import AppKit

@Observable fileprivate class Model {
    var message: String

    init(message: String) {
        self.message = message
    }
}

struct NSViewControllerRepresentableDemo: View {

    @State private var model = Model(message: "hello")

    var body: some View {
        VStack {
            Text("NSViewControllerRepresentable Demo")
                .font(.title)
                .padding()

            Text("Output: \(model.message)")
                .font(.title3)
                .padding()

            Representable(model: model)
                .frame(width: 200, height: 80)
        }
        .padding()
    }
}

fileprivate struct Representable: NSViewControllerRepresentable {

    // SwiftUI 와의 데이터 소통 창구
    let model: Model

    func makeNSViewController(context: Context) -> Controller {
        return Controller(host: self)
    }

    func updateNSViewController(_ controller: Controller, context: Context) {
        controller.updateText()
    }

    class Controller: NSViewController, NSTextViewDelegate {
        let host: Representable

        init(host: Representable) {
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
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.delegate = self

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
        func updateText() {

            // controller 초기화할 때 받아두었던 host 에는 당시 value 들이 저장되어 있다.
            // 업데이트된 value 들을 사용하려면 host 를 새로 받아야 한다.
            // 이런 문제 피하려면 value 타입과 @Binding 쓰지 말고 class 모델을 쓰자.

            guard let textView = self.view.subviews.first as? NSTextView else { fatalError() }
            textView.string = host.model.message
        }

        // AppKit 데이터를 SwiftUI 데이터로.
        func textDidChange(_ notification: Notification) {
            guard let textView = notification.object as? NSTextView else { return }
            host.model.message = textView.string
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(host: self)
    }

    @MainActor
    class Coordinator: NSObject {
        var host: Representable

        init(host: Representable) {
            self.host = host
        }
    }
}

#Preview {
    NSViewControllerRepresentableDemo()
}
