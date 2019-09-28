//
//  SearchResult.swift
//  AppStoreJsonApi
//
//  Created by 建達 陳 on 2019/7/16.
//  Copyright © 2019 RokurouC. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String
    let formattedPrice: String
    let description: String
    let releaseNotes: String
}
