//
//  ListMultidimensional.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/14/24.
//

import SwiftUI

struct ListMultidimensional: View {

    struct Sea: Hashable, Identifiable {
        let id = UUID()
        let name: String
    }

    struct Ocean: Identifiable {
        let id = UUID()
        let name: String
        let seas: [Sea]
    }

    let oceans: [Ocean] = [
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

    // 현업에서는 모델로
    var seas: [UUID: Sea] {
        var seas = [UUID: Sea]()
        for region in oceans {
            for sea in region.seas {
                seas[sea.id] = sea
            }
        }
        return seas
    }

    @State private var singleSelection: UUID?

    var body: some View {
        List(selection: $singleSelection) {
            ForEach(oceans) { region in
                Section {
                    ForEach(region.seas) { sea in
                        Text(sea.name)
                    }
                }
                header: {
                    Text("\(region.name)")
                }
            }
        }

        List {
            if let singleSelection {
                Text(seas[singleSelection]!.name)
            } else {
                //
            }
        }
    }

}
