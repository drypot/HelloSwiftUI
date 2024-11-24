//
//  TextDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/12/24.
//

import SwiftUI

struct TextDemo: View {

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding(.bottom, 36)
            HStack(alignment: .top, spacing: 36) {
                VStack(spacing: 18) {
                    Text("Large Title")
                        .font(.largeTitle)
                    Text("Title")
                        .font(.title)
                    Text("Title2")
                        .font(.title2)
                    Text("Title3")
                        .font(.title3)
                    Text("Headline")
                        .font(.headline)
                    Text("Subheadline")
                        .font(.subheadline)
                    Text("Body")
                        .font(.body)
                    Text("Callout")
                        .font(.callout)
                }

                VStack(spacing: 18) {
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

                VStack(spacing: 18) {
                    Text("foreground")
                        .foregroundStyle(.foreground)
                    Text("background")
                        .foregroundStyle(.background)
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
                        .cornerRadius(8)
                }
                .font(.title)

                VStack(spacing: 18) {
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
                    Text("yellow")
                        .foregroundStyle(.yellow)
                    Text("clear")
                        //.foregroundStyle(.clear)
                        .foregroundStyle(.white)
                        .background(.placeholder)
                        .cornerRadius(8)
                }
                .font(.title)
            }
        }
    }

}

#Preview {
    TextDemo()
}
