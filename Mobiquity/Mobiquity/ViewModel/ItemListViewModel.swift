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
    private var searchHistory: [String] = []

    init(repository: FlickrRepositoryProtocol = FlickrRepository()) {
        self.repository = repository
    }
    
    func loadData(searchParameters: SearchParameters) {
        guard let flickrRepo = repository as? FlickrRepository, searchParameters.page < 6 else { return }
                
        addSearchToHistory(searchParameters: searchParameters)

        flickrRepo.getImages(searchParameters: searchParameters)

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
    
    func fetchSearchHistory() -> [String] {
        SearchHistoryManager().fetchSearchHistory()
    }
    
    private func addSearchToHistory(searchParameters: SearchParameters) {
        if !searchParameters.text.isEmpty {
            // add the searched text in SQLite database if NOT exists
            let isExists: Bool = SearchHistoryManager().isExists(searchedText: searchParameters.text)
            if (!isExists) {
                SearchHistoryManager().addSearchText(searchText: searchParameters.text)
            }
        }
    }
}

private extension ItemListViewModel {
    func handleSuccess(data: ImageList) {
        if data.page != 1 {
            datasource.append(contentsOf: data.photos)
        } else {
            datasource = data.photos
        }
    }

    func handleFailure(error: Error) {
    }
}
