//
//  SimpleMessage.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/25/24.
//

import Foundation
import SwiftUI

struct SimpleMessage: Identifiable {

    static let messages = [
        SimpleMessage(message: "Simple Message 1"),
        SimpleMessage(message: "Simple Message 2"),
        SimpleMessage(message: "Simple Message 3"),
    ]

    static func messageById(_ id: Self.ID) -> SimpleMessage? {
        return Self.messages.first { $0.id == id }
    }

    let id = UUID()
    let message: String
}

struct SimpleMessageView: View {

    let message: SimpleMessage

    var body: some View {
        Text(message.message)
    }
}
