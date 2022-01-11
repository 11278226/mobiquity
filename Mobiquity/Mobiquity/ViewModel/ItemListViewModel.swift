//
//  ItemViewModel.swift
//  Mobiquity
//
//  Created by Diarmuid O'Keeffe on 10/01/2022.
//

import Combine

class ItemListViewModel: ListViewModelProtocol {
    @Published private(set) var datasource: [Item] = []
    private var repository: FlickrRepositoryProtocol
    private var cancellables = Set<AnyCancellable>()

    init(repository: FlickrRepositoryProtocol = FlickrRepository()) {
        self.repository = repository
    }
    
    func loadData() {
        guard let flickrRepo = repository as? FlickrRepository else { return }

        flickrRepo.getImages()

        flickrRepo.$imageList.sink { images in
            self.handleSuccess(data: images)
        }
        .store(in: &cancellables)

        flickrRepo.$error.sink { error in
        guard let someError = error else { return }
            self.handleFailure(error: someError)
        }
        .store(in: &cancellables)
    }
}

private extension ItemListViewModel {
    func handleSuccess(data: ImageList) {
        datasource = data.photos
    }

    func handleFailure(error: Error) {
    }
}
