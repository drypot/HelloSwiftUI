//
//  ImageDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/6/25.
//

import SwiftUI

struct ImageDemo: View {
    var body: some View {
        ZStack {
            //LinearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
            ContainerRelativeShape()
                .fill(Color.blue.gradient)
            VStack {
                Image(systemName: "cloud.sun.fill")
                    //.renderingMode(.original)
                    .symbolRenderingMode(.multicolor)
                    .resizable()
                    //.scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding()
                Image(systemName: "cloud.sun.fill")
                    //.renderingMode(.original)
                    .symbolRenderingMode(.hierarchical)
                    .resizable()
                    .foregroundStyle(.white)
                    //.scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding()
            }
            Spacer()
        }
    }
}

#Preview {
    ImageDemo()
}
