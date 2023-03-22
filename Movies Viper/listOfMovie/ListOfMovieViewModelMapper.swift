//
//  ListOfMovieViewModelMapper.swift
//  Movies
//
//  Created by Akel Barbosa on 18/03/23.
//

import Foundation

struct ListOfMovieViewModelMapper {
    func map(entity: PopularMovieEntity) -> ListOfMovieViewModel {
   
        return ListOfMovieViewModel(title: entity.title,
                                    overview: entity.overview,
                                    imageURL: URL(string: "https://image.tmdb.org/t/p/w500/" + entity.imageURL))
    
    }
}
