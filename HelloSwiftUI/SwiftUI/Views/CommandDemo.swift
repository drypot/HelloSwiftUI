//
//  CommandDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/22/24.
//

import SwiftUI

struct CommandSample: Commands {
    var body: some Commands {
        EmptyCommands()
    }
}

struct CommandDemo: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CommandDemo()
}
