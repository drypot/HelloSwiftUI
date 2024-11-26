//
//  SimpleFileDocumentView.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/27/24.
//

import SwiftUI

struct SimpleFileDocumentView: View {

    @Binding var document: SimpleFileDocument

    var body: some View {
        TextEditor(text: $document.content)
            .font(.custom("HelveticaNeue", size: 18))
            .lineSpacing(5)
            .scenePadding()
    }
}
