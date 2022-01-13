//
//  FlickrRepositoryProtocol.swift
//  Mobiquity
//
//  Created by Diarmuid O'Keeffe on 11/01/2022.
//

import Foundation

protocol FlickrRepositoryProtocol {
    func getImages(searchParameters: SearchParameters)
}
