//
//  MockServiceClient.swift
//  MobiquityTests
//
//  Created by Diarmuid O'Keeffe on 11/01/2022.
//

import Foundation
@testable import Mobiquity
import NetworkProvider

struct MockServiceClient: NetworkProviderProtocol {
  let urlSession: SessionProtocol
  var service: NetworkService
    
  var error = true

  init(session: SessionProtocol = Session(), clientService: NetworkService) {
    urlSession = session
    service = clientService
  }
    
    init(session: SessionProtocol = Session(), clientService: NetworkService, error: Bool) {
      urlSession = session
      service = clientService
        self.error = error
    }

  func request<T>(
    dataType: T.Type,
    onQueue: DispatchQueue = .main,
    completion: @escaping (Result<T, Swift.Error>) -> Void
  ) where T: Decodable {
      onQueue.async {
          if error {
              let error = Error.operationCancelled
              completion(Result.failure(error))
          } else {
              if let value = FlickrResult() as? T {
                  completion(Result.success(value))
                  return
              }
              let error = Error.operationCancelled
              completion(Result.failure(error))
          }
      }
  }
}
