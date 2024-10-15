//
//  SampleEvent.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/16/24.
//

import Foundation

extension OnThisDay.Event {

    typealias Event = OnThisDay.Event
    
    static var sampleEvent: Event = {
        let data = """
        {
          "links": {
            "0": {
              "1": "https://wikipedia.org/wiki/48_BC",
              "2": "48 BC"
            },
            "1": {
              "1": "https://wikipedia.org/wiki/Pompey",
              "2": "Pompey"
            },
            "2": {
              "1": "https://wikipedia.org/wiki/Ptolemy_XIII_Theos_Philopator",
              "2": "Ptolemy XIII"
            }
          },
          "text": "0048 BC &#8211; Pompey disembarks at Pelusium upon arriving in Egypt, whereupon he is assassinated by order of King Ptolemy XIII."
        }
        """.data(using: .utf8)!

        let event = try! JSONDecoder().decode(Event.self, from: data)
        return event
    }()

}
