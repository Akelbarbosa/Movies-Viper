//
//  ListOfMoviePresenter.swift
//  Movies
//
//  Created by Akel Barbosa on 18/03/23.
//

import Foundation

protocol ListOfMoviePresentable: AnyObject {
    var ui: ListOfMovieUI? { get }
    var viewModels: [ListOfMovieViewModel] { get }
    func onViewAppear()
}


protocol ListOfMovieUI: AnyObject {
    func update(movies: [ListOfMovieViewModel])
}

final class ListOfMoviePresenter: ListOfMoviePresentable {
    weak var ui: ListOfMovieUI?
    var viewModels: [ListOfMovieViewModel] = []
    private let mapper: ListOfMovieViewModelMapper
    
    private let ListOfMovieInteractor: ListOfMovieInterectable
    
    init(ListOfMovieInteractor: ListOfMovieInterectable, mapper: ListOfMovieViewModelMapper = ListOfMovieViewModelMapper() ) {
        self.ListOfMovieInteractor = ListOfMovieInteractor
        self.mapper = mapper
    }
    
    func onViewAppear() {
        Task {
            do {
                let models = try await ListOfMovieInteractor.getListOfMovies().results
                viewModels = models.map(mapper.map(entity:))
                ui?.update(movies: viewModels)
            } catch {
                print(error.localizedDescription)
            }

        }
    }
}
