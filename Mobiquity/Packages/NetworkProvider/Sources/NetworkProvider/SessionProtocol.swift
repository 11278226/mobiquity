//
//  SessionProtocol.swift
//  NetworkProvider
//
//  Created by Diarmuid O'Keeffe on 11/01/2022.
//

import Foundation

public protocol SessionProtocol {
  func dataTask<T: Decodable>(
    _ request: URLRequest,
    dataType: T.Type,
    completion: @escaping (Result<T, Swift.Error>) -> Void
  ) -> URLSessionDataTask
}

