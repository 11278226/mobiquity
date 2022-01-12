//
//  SearchParameters.swift
//  Mobiquity
//
//  Created by Diarmuid O'Keeffe on 11/01/2022.
//

import Foundation

struct SearchParameters {
    var text: String
    var page: Int

    public init(text: String, page: Int = 1) {
        self.text = text
        self.page = page
    }
}
