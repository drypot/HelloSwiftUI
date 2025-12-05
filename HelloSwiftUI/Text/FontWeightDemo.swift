//
//  FontWeightDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/12/24.
//

import SwiftUI

struct FontWeightDemo: View {

    var body: some View {
        VStack(spacing: 18) {
            Text("fontWeight(...)")
            Text("black")
                .fontWeight(.black)
            Text("heavy")
                .fontWeight(.heavy)
            Text("bold")
                .fontWeight(.bold)
            Text("semibold")
                .fontWeight(.semibold)
            Text("medium")
                .fontWeight(.medium)
            Text("regular")
                .fontWeight(.regular)
            Text("light")
                .fontWeight(.light)
            Text("thin")
                .fontWeight(.thin)
            Text("ultraLight")
                .fontWeight(.ultraLight)
        }
        .font(.title)
    }
}

#Preview {
    FontWeightDemo()
}
