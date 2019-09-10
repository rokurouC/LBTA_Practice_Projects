//
//  Service.swift
//  AppStoreJsonApi
//
//  Created by 建達 陳 on 2019/7/17.
//  Copyright © 2019 RokurouC. All rights reserved.
//

import Foundation

class Service {
    static let shared = Service()
    
    func fetchITunesApi(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, rsp, err) in
            guard err == nil else {
                print("Failed to fetch data:", err!)
                completion([], err)
                return
            }
            guard let data = data else { return }
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results, nil)
            }catch let decodeErr {
                print("Failed to decode data:", decodeErr)
                completion([], decodeErr)
            }
            }.resume()
    }
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json"
        fetchAppGroup(urlStrin: urlString, completion: completion)
    }
    
    func fetchTopGrossing(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/50/explicit.json"
        fetchAppGroup(urlStrin: urlString, completion: completion)
    }
    
    func fetchAppGroup(urlStrin: String, completion: @escaping (AppGroup?, Error?) -> Void) {
        guard let url = URL(string: urlStrin) else { return }
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if let err = error {
                completion(nil, err)
                return
            }
            do {
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data!)
                completion(appGroup, nil)
            } catch {
                print("Faild to decode:", error)
            }
            }.resume()
    }
}
