//
//  NSColorForTextDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/12/24.
//

import SwiftUI

struct NSColorForTextDemo: View {

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 48) {
                labelColorList
                textColorList
                contentColorList
                menuColorList
                tableColorList
                controlColorList
                windowColorList
                highlightColorList
                fillColorList
            }
            .font(.title)
            .padding(32)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }

    var labelColorList: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Label")
                .font(.largeTitle)
            Text("labelColor")
                .foregroundStyle(Color(nsColor: .labelColor))
            Text("secondaryLabelColor")
                .foregroundStyle(Color(nsColor: .secondaryLabelColor))
            Text("tertiaryLabelColor")
                .foregroundStyle(Color(nsColor: .tertiaryLabelColor))
            Text("quaternaryLabelColor")
                .foregroundStyle(Color(nsColor: .quaternaryLabelColor))
        }
    }

    var textColorList: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Text")
                .font(.largeTitle)
            Text("textColor / textBackgroundColor")
                .foregroundStyle(Color(nsColor: .textColor))
                .background(Color(nsColor: .textBackgroundColor))
            Text("placeholderTextColor / textBackgroundColor")
                .foregroundStyle(Color(nsColor: .placeholderTextColor))
                .background(Color(nsColor: .textBackgroundColor))
            Text("selectedTextColor / selectedTextBackgroundColor")
                .foregroundStyle(Color(nsColor: .selectedTextColor))
                .background(Color(nsColor: .selectedTextBackgroundColor))
            Text("unemphasizedSelectedTextColor / unemphasizedSelectedTextBackgroundColor")
                .foregroundStyle(Color(nsColor: .unemphasizedSelectedTextColor))
                .background(Color(nsColor: .unemphasizedSelectedTextBackgroundColor))
            Text("keyboardFocusIndicatorColor / textBackgroundColor")
                .foregroundStyle(Color(nsColor: .keyboardFocusIndicatorColor))
                .background(Color(nsColor: .textBackgroundColor))
        }
    }

    var contentColorList: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Content")
                .font(.largeTitle)
            Text("linkColor")
                .foregroundStyle(Color(nsColor: .linkColor))
            Text("separatorColor")
                .foregroundStyle(Color(nsColor: .separatorColor))
            Text("selectedTextColor / selectedContentBackgroundColor")
                .foregroundStyle(Color(nsColor: .selectedTextColor))
                .background(Color(nsColor: .selectedContentBackgroundColor))
            Text("selectedTextColor / unemphasizedSelectedContentBackgroundColor")
                .foregroundStyle(Color(nsColor: .selectedTextColor))
                .background(Color(nsColor: .unemphasizedSelectedContentBackgroundColor))
        }
    }

    var menuColorList: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Menu")
                .font(.largeTitle)
            Text("selectedMenuItemTextColor / selectedContentBackgroundColor")
                .foregroundStyle(Color(nsColor: .selectedMenuItemTextColor))
                .background(Color(nsColor: .selectedContentBackgroundColor))
        }
    }

    var tableColorList: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Table")
                .font(.largeTitle)
            Text("gridColor")
                .foregroundStyle(Color(nsColor: .gridColor))
            Text("headerTextColor")
                .foregroundStyle(Color(nsColor: .headerTextColor))
            Text("textColor / alternatingContentBackgroundColors[0]")
                .foregroundStyle(Color(nsColor: .textColor))
                .background(Color(nsColor: .alternatingContentBackgroundColors[0]))
            Text("textColor / alternatingContentBackgroundColors[1]")
                .foregroundStyle(Color(nsColor: .textColor))
                .background(Color(nsColor: .alternatingContentBackgroundColors[1]))
        }
    }

    var controlColorList: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Control")
                .font(.largeTitle)
            Text("controlAccentColor")
                .foregroundStyle(Color(nsColor: .controlAccentColor))
            Text("controlTextColor / controlColor")
                .foregroundStyle(Color(nsColor: .controlTextColor))
                .background(Color(nsColor: .controlColor))
            Text("controlTextColor / controlBackgroundColor")
                .foregroundStyle(Color(nsColor: .controlTextColor))
                .background(Color(nsColor: .controlBackgroundColor))
            Text("disabledControlTextColor / controlBackgroundColor")
                .foregroundStyle(Color(nsColor: .disabledControlTextColor))
                .background(Color(nsColor: .controlBackgroundColor))
            Text("selectedControlTextColor / selectedControlColor")
                .foregroundStyle(Color(nsColor: .selectedControlTextColor))
                .background(Color(nsColor: .selectedControlColor))
            Text("alternateSelectedControlTextColor / selectedControlColor")
                .foregroundStyle(Color(nsColor: .alternateSelectedControlTextColor))
                .background(Color(nsColor: .selectedControlColor))
            Text("alternateSelectedControlTextColor / controlAccentColor")
                .foregroundStyle(Color(nsColor: .alternateSelectedControlTextColor))
                .background(Color(nsColor: .controlAccentColor))
            Text("controlTextColor / scrubberTexturedBackground")
                .foregroundStyle(Color(nsColor: .controlTextColor))
                .background(Color(nsColor: .scrubberTexturedBackground))
        }
    }

    var windowColorList: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Window")
                .font(.largeTitle)
            Text("controlTextColor / windowBackgroundColor")
                .foregroundStyle(Color(nsColor: .textColor))
                .background(Color(nsColor: .windowBackgroundColor))
            Text("windowFrameTextColor / windowBackgroundColor")
                .foregroundStyle(Color(nsColor: .windowFrameTextColor))
                .background(Color(nsColor: .windowBackgroundColor))
        }
    }

    var highlightColorList: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Highlight")
                .font(.largeTitle)
            Text("textColor / findHighlightColor")
                .foregroundStyle(Color(nsColor: .textColor))
                .background(Color(nsColor: .findHighlightColor))
        }
    }

    var fillColorList: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Fill")
                .font(.largeTitle)
            Text("labelColor / systemFill")
                .foregroundStyle(Color(nsColor: .labelColor))
                .background(Color(nsColor: .systemFill))
            Text("secondaryLabelColor / secondarySystemFill")
                .foregroundStyle(Color(nsColor: .secondaryLabelColor))
                .background(Color(nsColor: .secondarySystemFill))
            Text("tertiaryLabelColor / tertiarySystemFill")
                .foregroundStyle(Color(nsColor: .tertiaryLabelColor))
                .background(Color(nsColor: .tertiarySystemFill))
            Text("quaternaryLabelColor / quaternarySystemFill")
                .foregroundStyle(Color(nsColor: .quaternaryLabelColor))
                .background(Color(nsColor: .quaternarySystemFill))
            Text("quinaryLabel / quinarySystemFill")
                .foregroundStyle(Color(nsColor: .quinaryLabel))
                .background(Color(nsColor: .quinarySystemFill))
        }
    }
}

#Preview {
    ShapeStyleForTextDemo()
}
