//
//  SearchParameters.swift
//  Mobiquity
//
//  Created by Diarmuid O'Keeffe on 11/01/2022.
//

import Foundation

struct SearchParameters {
    var text: String
    var page: Int?
    var perPage: Int?

    public init(text: String, page: Int?, perPage: Int?) {
        self.text = text
        self.page = page
        self.perPage = perPage
    }
}
