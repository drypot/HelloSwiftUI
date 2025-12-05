//
//  ForegroundStyleDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/12/24.
//

import SwiftUI

struct ForegroundStyleDemo: View {

    var body: some View {
        HStack(alignment: .top, spacing: 36) {
            VStack(spacing: 18) {
                Text("foregroundStyle(...)")
                Text("foreground")
                    .foregroundStyle(.foreground)
                Text("background")
                    .foregroundStyle(.background)
                    .background(.placeholder)
                    .cornerRadius(4)
                Text("selection")
                    .foregroundStyle(.selection)
                Text("separator")
                    .foregroundStyle(.separator)
                Text("tint")
                    .foregroundStyle(.tint)
                Text("placeholder")
                    .foregroundStyle(.placeholder)
                Text("link")
                    .foregroundStyle(.link)
                Text("fill")
                    .foregroundStyle(.fill)
                Text("windowBackground")
                    .foregroundStyle(.windowBackground)
                    .background(.placeholder)
                    .cornerRadius(4)
            }
            .font(.title)

            VStack(spacing: 18) {
                Text("foregroundStyle(...)")
                Text("primary")
                    .foregroundStyle(.primary)
                Text("secondary")
                    .foregroundStyle(.secondary)
                Text("tertiary")
                    .foregroundStyle(.tertiary)
                Text("quaternary")
                    .foregroundStyle(.quaternary)
                Text("quinary")
                    .foregroundStyle(.quinary)
            }
            .font(.title)

            VStack(spacing: 9) {
                Text("foregroundStyle(...)")
                Text("black")
                    .foregroundStyle(.black)
                Text("blue")
                    .foregroundStyle(.blue)
                Text("brown")
                    .foregroundStyle(.brown)
                Text("cyan")
                    .foregroundStyle(.cyan)
                Text("gray")
                    .foregroundStyle(.gray)
                Text("green")
                    .foregroundStyle(.green)
                Text("indigo")
                    .foregroundStyle(.indigo)
                Text("mint")
                    .foregroundStyle(.mint)
                Text("orange")
                    .foregroundStyle(.orange)
                Text("pink")
                    .foregroundStyle(.pink)
                Text("purple")
                    .foregroundStyle(.purple)
                Text("red")
                    .foregroundStyle(.red)
                Text("teal")
                    .foregroundStyle(.teal)
                Text("white")
                    .foregroundStyle(.white)
                    .background(.placeholder)
                    .cornerRadius(4)
                Text("yellow")
                    .foregroundStyle(.yellow)
                Text("clear")
                    //.foregroundStyle(.clear)
                    .foregroundStyle(.white)
                    .background(.placeholder)
                    .cornerRadius(4)
            }
            .font(.title)
        }
    }

}

#Preview {
    ForegroundStyleDemo()
}
