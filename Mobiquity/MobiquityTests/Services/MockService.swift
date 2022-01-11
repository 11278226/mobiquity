//
//  MockService.swift
//  MobiquityTests
//
//  Created by Diarmuid O'Keeffe on 11/01/2022.
//

import Foundation
@testable import Mobiquity
import NetworkProvider

struct MockService: NetworkService {
  var baseURL: String {
    ""
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

  var queryParameters: [URLQueryItem]? {
    []
  }

  var timeout: TimeInterval? {
    1
  }

  var path: String {
    ""
  }
}


