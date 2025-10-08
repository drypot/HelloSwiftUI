//
//  NSViewControllerRepresentable.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/23/24.
//


import SwiftUI
import AppKit

@Observable fileprivate class Model {
    var text: String

    init(text: String) {
        self.text = text
    }
}

struct NSViewControllerRepresentableDemo: View {

    @State private var model = Model(text: "Hello")

    var body: some View {
        VStack {
            Text("\(model.text)")
                .font(.title3)
                .padding()
                .frame(width: 200, height: 120, alignment: .topLeading)
                .border(Color.gray, width: 1)

            CustomView(model: model)
                .frame(width: 200, height: 120)

            Button("Reset") {
                model.text = "Hello"
            }
            .frame(width: 200, height: 80)
        }
        .padding()
    }
}

fileprivate struct CustomView: NSViewControllerRepresentable {

    let model: Model

    func makeNSViewController(context: Context) -> Controller {
        return Controller(host: self)
    }

    func updateNSViewController(_ controller: Controller, context: Context) {
        controller.updateViews()
    }

    class Controller: NSViewController, NSTextViewDelegate {
        let host: CustomView

        init(host: CustomView) {
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
        func updateViews() {

            // controller 초기화할 때 받아두었던 host 에는 당시 value 들이 저장되어 있다.
            // 업데이트된 value 들을 사용하려면 host 를 새로 받아야 한다.
            // 이런 문제 피하려면 value 타입과 @Binding 쓰지 말고 class 모델을 쓰자.

            guard let textView = self.view.subviews.first as? NSTextView else { fatalError() }
            textView.string = host.model.text
        }

        // AppKit View 데이터를 SwiftUI 에 업데이트.
        func textDidChange(_ notification: Notification) {
            guard let textView = notification.object as? NSTextView else { return }
            host.model.text = textView.string
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(host: self)
    }

    class Coordinator: NSObject {
        var host: CustomView

        init(host: CustomView) {
            self.host = host
        }
    }
}

#Preview {
    NSViewControllerRepresentableDemo()
}
