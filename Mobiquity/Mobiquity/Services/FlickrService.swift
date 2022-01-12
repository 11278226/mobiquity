//
//  FlickrService.swift
//  Mobiquity
//
//  Created by Diarmuid O'Keeffe on 11/01/2022.
//

import Foundation
import NetworkProvider

enum FlickrService {
    case getImages(parameters: SearchParameters? = SearchParameters(text: "", page: 1))
}

extension FlickrService: NetworkService {
    var baseURL: String {
        guard let baseURL = Bundle.main.object(
          forInfoDictionaryKey: "FLICKR_BASE_URL"
        ) as? String, !baseURL.isEmpty else {
          fatalError("FLICKR_BASE_URL can't be nil or empty")
        }
        return baseURL
    }

    var method: HttpMethod {
        .get
    }

    var httpBody: Encodable? {
        nil
    }

    var headers: [String: String]? {
        [HttpHeaderKey.accept: MimeType.json.rawValue]
    }
    
    public var apiKey: String {
        guard let apiKey = Bundle.main.object(
            forInfoDictionaryKey: "FLICKR_API_KEY"
        ) as? String, !apiKey.isEmpty else {
            fatalError("FLICKR_API_KEY can't be nil or empty")
        }
        return apiKey
    }

  var queryParameters: [URLQueryItem]? {
      var queryItems = [URLQueryItem]()
      let apiKeyQueryItem = URLQueryItem(name: "api_key", value: apiKey)
      queryItems.append(apiKeyQueryItem)
      let safeSearchQueryItem = URLQueryItem(name: "safe_search", value: "1")
      queryItems.append(safeSearchQueryItem)
      let formatQueryItem = URLQueryItem(name: "format", value: "json")
      queryItems.append(formatQueryItem)
      let jsonCallBackQueryItem = URLQueryItem(name: "nojsoncallback", value: "1")
      queryItems.append(jsonCallBackQueryItem)

      switch self {
      case .getImages(let parameters):
          if let searchText = parameters?.text, !searchText.isEmpty {
              let methodQueryItem = URLQueryItem(name: "method", value: "flickr.photos.search")
              let textQueryItem = URLQueryItem(name: "text", value: searchText)
              queryItems.append(contentsOf: [methodQueryItem, textQueryItem])
          } else {
              let methodQueryItem = URLQueryItem(name: "method", value: "flickr.photos.getRecent")
              queryItems.append(contentsOf: [methodQueryItem])
          }
          let pageQueryItem = URLQueryItem(name: "page", value: String(parameters?.page ?? 1))
          let perPageQueryItem = URLQueryItem(name: "per_page", value: String(50))
          queryItems.append(contentsOf: [pageQueryItem, perPageQueryItem])
      }
      

      return queryItems
  }

  var timeout: TimeInterval? {
    30
  }

  var path: String {
    "/services/rest/"
  }
}
