//
//  ShapeStyleForTextDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/12/24.
//

import SwiftUI

struct ShapeStyleForTextDemo: View {

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 48) {
                systemColorList
                hierarchicalList
                semanticList
                materialList
                shapeList
            }
            .font(.title)
            .padding(32)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }

    var systemColorList: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("System colors")
                .font(.largeTitle)
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
            Text("yellow")
                .foregroundStyle(.yellow)
            Text("white / gray")
                .foregroundStyle(.white)
                .background(.gray)
            Text("clear / gray")
                .foregroundStyle(.clear)
                .background(.gray)
        }
    }

    var hierarchicalList: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Hierarchical")
                .font(.largeTitle)
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
    }

    var semanticList: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Semantic")
                .font(.largeTitle)
            Text("foreground / background")
                .foregroundStyle(.foreground)
                .background(.background)
            Text("foreground / windowBackground")
                .foregroundStyle(.foreground)
                .background(.windowBackground)
            Text("foreground / selection")
                .foregroundStyle(.foreground)
                .background(.selection)
            Text("foreground / fill")
                .foregroundStyle(.foreground)
                .background(.fill)
            Text("tint")
                .foregroundStyle(.tint)
            Text("placeholder")
                .foregroundStyle(.placeholder)
            Text("link")
                .foregroundStyle(.link)
            Text("separator")
                .foregroundStyle(.separator)
        }
    }

    var materialList: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Materials")
                .font(.largeTitle)
            Text("ultraThinMaterial")
                .foregroundStyle(.foreground)
                .background(.ultraThinMaterial)
            Text("windowBackground")
                .foregroundStyle(.foreground)
                .background(.thinMaterial)
            Text("regularMaterial")
                .foregroundStyle(.foreground)
                .background(.regularMaterial)
            Text("thickMaterial")
                .foregroundStyle(.foreground)
                .background(.thickMaterial)
            Text("ultraThickMaterial")
                .foregroundStyle(.foreground)
                .background(.ultraThickMaterial)
        }
    }

    var shapeList: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Shape")
                .font(.largeTitle)
            Text(".yellow.gradient")
                .padding(4)
                .background(.yellow.gradient)
            Text(".yellow, in: Capsule()")
                .padding(4)
                .background(.yellow, in: Capsule())
            Text("RoundedRectangle(cornerRadius:)")
                .padding(4)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.yellow)
                )
            Text("Rectangle().clipShape().shadow()")
                .padding(4)
                .background(
                    Rectangle()
                        .foregroundStyle(.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        .shadow(radius: 8)
                )
        }
    }
}

#Preview {
    ShapeStyleForTextDemo()
}
