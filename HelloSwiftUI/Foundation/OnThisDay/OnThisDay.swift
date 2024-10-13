//
//  OnThisDay.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/13/24.
//

import Foundation
import AppKit

// On This Day API
// https://today.zenquotes.io

// macOS by Tutorials-raywenderlich (2022), 1장,

struct OnThisDay: Decodable {

    enum FetchError: Error {
        case badURL
        case badResponse
        case badJSON
    }

    let info: String
    let date: String

    let data: DayData

    var displayDate: String {
        date.replacingOccurrences(of: "_", with: " ")
    }

    static func requestFor(month:Int, day:Int) async throws -> OnThisDay {
        let address = "https://today.zenquotes.io/api/\(month)/\(day)"
        guard let url = URL(string: address) else {
            throw FetchError.badURL
        }
        let request = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse, response.statusCode < 400 else {
            throw FetchError.badResponse
        }

        return try decodeFrom(data: data)
    }

    static func decodeFrom(data: Data) throws -> OnThisDay {
        do {
            let day = try JSONDecoder().decode(OnThisDay.self, from: data)
            return day
        } catch {
            print("\(error)")
            throw FetchError.badJSON
        }
    }

    struct DayData: Decodable {

        enum CodingKeys: String, CodingKey {
            case events = "Events"
            case births = "Births"
            case deaths = "Deaths"
        }

        let events: [Event]
        let births: [Event]
        let deaths: [Event]
    }

    struct Event: Decodable, Identifiable {

        let id = UUID()
        let text: String
        let year: String
        let links: [EventLink]

        enum CodingKeys: String, CodingKey {
            case text
            case links
        }

/*
        Event JSON sample

        {
            "text": "1066 &#8211; The Norman conquest of England begins with the Battle of Hastings.",
            "html": "<a href=\"https://wikipedia.org/wiki/1066\" title=\"1066\">1066</a> &#8211; The <a href=\"https://wikipedia.org/wiki/Norman_Conquest\" title=\"Norman Conquest\">Norman conquest of England</a> begins with the <a href=\"https://wikipedia.org/wiki/Battle_of_Hastings\" title=\"Battle of Hastings\">Battle of Hastings</a>.",
            "links": {
                "0": {
                    "0": "<a href=\"https://wikipedia.org/wiki/1066\" title=\"1066\">1066</a>",
                    "1": "https://wikipedia.org/wiki/1066",
                    "2": "1066"
                },
                "1": {
                    "0": "<a href=\"https://wikipedia.org/wiki/Norman_Conquest\" title=\"Norman Conquest\">Norman conquest of England</a>",
                    "1": "https://wikipedia.org/wiki/Norman_Conquest",
                    "2": "Norman conquest of England"
                },
            }
        },
*/

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)

            let rawText = try values.decode(String.self, forKey: .text)
            let textParts = rawText.components(separatedBy: " &#8211; ")
            if textParts.count == 2 {
                year = textParts[0]
                text = removeHTMLTag(textParts[1])
            } else {
                year = "?"
                text = removeHTMLTag(rawText)
            }

            let eventLinks = try values.decode(EventLinks.self, forKey: .links)
            links = eventLinks.links
        }
    }

    struct EventLinks: Decodable {

        let links: [EventLink]

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CustomKey.self)

            var tempArray = [EventLink]()

            for key in container.allKeys.sorted(by: { $0.stringValue < $1.stringValue }) {
                let link = try container.decode(EventLink.self, forKey: key)
                tempArray.append(link)
            }

            self.links = tempArray
        }

        // Helper structure to handle dynamic keys (e.g., "0", "1", "2")
        struct CustomKey: CodingKey {
            var stringValue: String
            init?(stringValue: String) { self.stringValue = stringValue }

            var intValue: Int?
            init?(intValue: Int) { return nil }
        }

    }

    struct EventLink: Decodable, Identifiable {

        let id = UUID()
        let title: String
        let url: URL

        enum CodingKeys: String, CodingKey {
            case url = "1"
            case title = "2"
        }

    }

}

fileprivate func removeHTMLTag(_ string: String) -> String {
    let attr = try? NSAttributedString(
        data: Data(string.utf8),
        options: [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ],
        documentAttributes: nil
    )

    return attr?.string ?? string
}
