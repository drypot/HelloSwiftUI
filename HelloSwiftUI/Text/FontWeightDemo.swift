//
//  FontWeightDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/12/24.
//

import SwiftUI

struct FontWeightDemo: View {

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 48) {
                fontWeightList
            }
            .font(.title)
            .padding(32)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }

    var fontWeightList: some View {
        VStack(alignment: .leading, spacing: 8) {
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
    }
}

#Preview {
    FontWeightDemo()
}
