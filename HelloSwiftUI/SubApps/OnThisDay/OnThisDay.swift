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

    static func fetchFromAPI(month:Int, day:Int) async throws -> OnThisDay {
        let urlString = "https://today.zenquotes.io/api/\(month)/\(day)"
        guard let url = URL(string: urlString) else {
            throw FetchError.badURL
        }
        let request = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse, response.statusCode < 400 else {
            throw FetchError.badResponse
        }

        return try decode(from: data)
    }

    static func decode(from data: Data) throws -> OnThisDay {
        do {
            let day = try JSONDecoder().decode(OnThisDay.self, from: data)
            return day
        } catch {
            print("\(error)")
            throw FetchError.badJSON
        }
    }

    struct DayData: Decodable {
        let events: [Event]
        let births: [Event]
        let deaths: [Event]

        enum CodingKeys: String, CodingKey {
            case events = "Events"
            case births = "Births"
            case deaths = "Deaths"
        }
    }

    // enum 밸류 루프 돌리려면 CaseIterable 필요하다.

    enum EventType: String, CaseIterable {
        case events = "Events"
        case births = "Births"
        case deaths = "Deaths"
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

            let eventLinkDictionary = try values.decode([String: EventLink].self, forKey: .links)
            let eventLinkKeys = eventLinkDictionary.keys.sorted()
            links = eventLinkKeys.compactMap { eventLinkDictionary[$0] }
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
