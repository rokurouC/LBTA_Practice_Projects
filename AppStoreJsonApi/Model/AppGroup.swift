//
//  AppGroup.swift
//  AppStoreJsonApi
//
//  Created by 建達 陳 on 2019/9/7.
//  Copyright © 2019 RokurouC. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let name, artistName, artworkUrl100: String
}
