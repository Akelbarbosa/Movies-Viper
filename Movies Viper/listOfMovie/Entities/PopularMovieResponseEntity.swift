//
//  PopularMovieResponseEntity.swift
//  Movies
//
//  Created by Akel Barbosa on 18/03/23.
//

import Foundation

struct PopularMovieResponseEntity: Decodable {
    let results: [PopularMovieEntity]
}
