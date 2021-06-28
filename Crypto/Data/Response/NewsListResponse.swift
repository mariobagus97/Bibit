//
//  NewsListResponse.swift
//  Crypto
//
//  Created by Muhammad Ario Bagus on 29/04/21.
//

import Foundation

// MARK: - NewsListResponse
struct NewsListResponse: Codable {
    let type: Int
    let message: String
    let data: [Datum2]
    let rateLimit: RateLimit2
    let hasWarning: Bool

    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case message = "Message"
        case data = "Data"
        case rateLimit = "RateLimit"
        case hasWarning = "HasWarning"
    }
    func toEntity() -> [News] {
        var list = [News]()
        for data in data {
            list.append(News(source: data.source, title: data.title, body: data.body))
        }
        return list
    }
}

// MARK: - Datum
struct Datum2: Codable {
    let id: String
    let guid: String
    let imageurl: String
    let title: String
    let url: String
    let source, body, tags, categories: String
    let upvotes, downvotes: String
    let lang: Lang

    enum CodingKeys: String, CodingKey {
        case id, guid
        case imageurl, title, url, source, body, tags, categories, upvotes, downvotes, lang
    }
}

enum Lang: String, Codable {
    case en = "EN"
}

// MARK: - RateLimit
struct RateLimit2: Codable {
}
