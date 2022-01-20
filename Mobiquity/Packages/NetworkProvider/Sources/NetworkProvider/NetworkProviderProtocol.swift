//
//  NetworkProviderProtocol.swift
//  NetworkProvider
//
//  Created by Diarmuid O'Keeffe on 11/01/2022.
//

import Foundation

public protocol NetworkProviderProtocol {
  var urlSession: SessionProtocol { get }
  var service: NetworkService { get set }
  
  func request<T: Decodable>(
    dataType: T.Type,
    onQueue: DispatchQueue,
    completion: @escaping (Result<T, Swift.Error>) -> Void
  )
}
