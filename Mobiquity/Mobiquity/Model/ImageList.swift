//
//  ImageList.swift
//  Mobiquity
//
//  Created by Diarmuid O'Keeffe on 11/01/2022.
//

import Foundation

struct ImageList: Decodable {
    let page: Int
    let photos: [Item]
    let perPage: Int
    let totalPages: Int
    let totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case photos = "photo"
        case perPage = "perpage"
        case totalPages = "pages"
        case totalResults = "total"
    }
    
    init(page: Int = 1, photos: [Item] = [], perPage: Int = 2, totalPages: Int = 1, totalResults: Int = 0) {
        self.page = page
        self.photos = photos
        self.perPage = perPage
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}

struct FlickrResult: Decodable {
    let photos: ImageList
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case photos
        case status = "stat"
    }
    
#if DEBUG
    init() {
        status = "ok"
        let item1 = Item(id: "1", owner: "", secret: "", server: "", farm: 1, title: "Hello One", isPublic: 1, isFriend: 0, isFamily: 0)
        let item2 = Item(id: "2", owner: "", secret: "", server: "", farm: 1, title: "Hello Two", isPublic: 1, isFriend: 0, isFamily: 0)
        photos = ImageList(page: 1, photos: [item1, item2], perPage: 1, totalPages: 1, totalResults: 2)
    }
#endif
}
