//
//  OnThisDayTest.swift
//  HelloSwftUITests
//
//  Created by Kyuhyun Park on 10/13/24.
//

import Foundation
import Testing

struct OnThisDayTest {

    @Test func canDecodeFromData() async throws {

        let data: Data! = onThisDayFixture.data(using: .utf8)
        let day = try OnThisDay.decodeFrom(data: data)
        #expect(day.info == "OnThisDay API")
        #expect(day.date == "October_14")

        #expect(day.data.events.count == 3)
        do {
            let event = day.data.events[0]
            #expect(event.text == "The Norman conquest of England begins with the Battle of Hastings.")

            let links = event.links
            #expect(links.count == 3)

            do {
                let link = links[0]
                #expect(link.title == "1066")
                #expect(link.url.absoluteString == "https://wikipedia.org/wiki/1066")
            }

            do {
                let link = links[1]
                #expect(link.title == "Norman conquest of England")
                #expect(link.url.absoluteString == "https://wikipedia.org/wiki/Norman_Conquest")
            }
        }

        #expect(day.data.births.count == 3)
        do {
            let event = day.data.births[0]
            #expect(event.text == "Przemysł II of Poland (d. 1296)")

            let links = event.links
            #expect(links.count == 2)

            do {
                let link = links[0]
                #expect(link.title == "1257")
                #expect(link.url.absoluteString == "https://wikipedia.org/wiki/1257")
            }

            do {
                let link = links[1]
                #expect(link.title == "Przemysł II")
                #expect(link.url.absoluteString == "https://wikipedia.org/wiki/Przemys%C5%82_II")
            }
        }

        #expect(day.data.deaths.count == 3)
    }

}
