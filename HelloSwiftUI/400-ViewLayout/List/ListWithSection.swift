//
//  ListWithSection.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/14/24.
//

import SwiftUI

struct ListWithSection: View {

    struct Sea: Identifiable, Hashable, IDHashable {
        let id = UUID()
        let name: String
    }

    struct Ocean: Identifiable, Hashable, IDHashable {
        let id = UUID()
        let name: String
        let seas: [Sea]
    }

    static let oceans: [Ocean] = [
        Ocean(
            name: "Pacific",
            seas: [
                Sea(name: "Australasian Mediterranean"),
                Sea(name: "Philippine"),
                Sea(name: "Coral"),
                Sea(name: "South China")
            ]
        ),
        Ocean(
            name: "Atlantic",
            seas: [
                Sea(name: "American Mediterranean"),
                Sea(name: "Sargasso"),
                Sea(name: "Caribbean")
            ]
        ),
        Ocean(
            name: "Indian",
            seas: [Sea(name: "Bay of Bengal")]
        ),
        Ocean(
            name: "Southern",
            seas: [Sea(name: "Weddell")]
        ),
        Ocean(
            name: "Arctic",
            seas: [Sea(name: "Greenland")]
        )
    ]

    // 지금은 안 쓰이는데 Sea 대신 Sea.ID 로 선택할 경우 이름 탐색에 사용할 수 있다.
    static var seas = {
        var seas = [Sea.ID: Sea]()
        for ocean in Self.oceans {
            for sea in ocean.seas {
                seas[sea.id] = sea
            }
        }
        return seas
    }()

    @State private var selectedSea: Sea?

    var body: some View {
        HStack {
            List(selection: $selectedSea) {
                ForEach(Self.oceans) { ocean in
                    Section {
                        ForEach(ocean.seas, id:\.self) { sea in
                            Text(sea.name)
                        }
                    }
                    header: {
                        Text("\(ocean.name)")
                    }
                }
            }
            
            List {
                if let selectedSea {
                    Text(selectedSea.name)
                } else {
                    Spacer()
                }
            }
        }
    }

}
