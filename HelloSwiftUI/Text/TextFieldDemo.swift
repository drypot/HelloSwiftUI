//
//  TextFieldDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/12/24.
//

import SwiftUI

struct TextFieldDemo: View {

    @State var name: String = ""

    var body: some View {
        VStack {
            TextField("Enter name", text: $name)
                .padding(.all)
                .frame(width: 300)
            if !name.isEmpty {
                Text("Hello, \(name)!")
                    .foregroundStyle(Color.pink)
            } else {
                Text("Hello")
            }
        }
        .font(.title)
    }
}

#Preview {
    TextFieldDemo()
}
