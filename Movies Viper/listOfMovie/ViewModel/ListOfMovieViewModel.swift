//
//  ListOfMovieViewModel.swift
//  Movies
//
//  Created by Akel Barbosa on 18/03/23.
//

import Foundation

struct ListOfMovieViewModel: Decodable {
    var title: String
    var overview: String
    var imageURL: URL?
}
