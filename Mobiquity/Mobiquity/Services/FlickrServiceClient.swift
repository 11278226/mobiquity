//
//  FlickrServiceClient.swift
//  Mobiquity
//
//  Created by Diarmuid O'Keeffe on 11/01/2022.
//

import Foundation
import NetworkProvider

struct FlickrServiceClient: NetworkProviderProtocol {
    let urlSession: SessionProtocol
    var service: NetworkService

    init(session: SessionProtocol = Session(), clientService: NetworkService) {
        urlSession = session
        service = clientService
    }

    func request<T>(dataType: T.Type, onQueue: DispatchQueue = .main, completion: @escaping (Result<T, Swift.Error>) -> Void) where T: Decodable {
        let task = urlSession.dataTask(service.urlRequest, dataType: dataType) { result in
            onQueue.async {
                completion(result)
            }
        }
        task.resume()
    }
}
