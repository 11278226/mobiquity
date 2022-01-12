//
//  FlickrRepository.swift
//  Mobiquity
//
//  Created by Diarmuid O'Keeffe on 11/01/2022.
//

import Combine
import Foundation
import NetworkProvider

class FlickrRepository: FlickrRepositoryProtocol {
    var client: NetworkProviderProtocol?
    @Published var imageList = ImageList()
    @Published var error: Swift.Error?
    
    init(client: NetworkProviderProtocol = FlickrServiceClient(clientService: FlickrService.getImages())) {
        self.client = client
    }

    func getImages(searchParameters: SearchParameters) {
        client?.service = FlickrService.getImages(parameters: searchParameters)
        fetchImages(client: client!)
    }

}

private extension FlickrRepository {
    func fetchImages(client: NetworkProviderProtocol) {
        client.request(dataType: FlickrResult.self, onQueue: .main) { result in
            do {
                let flickrResult = try result.get()
                self.imageList = flickrResult.photos
            } catch {
                self.error = error
            }
        }
    }
}
