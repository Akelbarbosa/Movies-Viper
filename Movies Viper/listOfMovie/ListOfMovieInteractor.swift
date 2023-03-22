//
//  ListOfMovieInteractor.swift
//  Movies
//
//  Created by Akel Barbosa on 18/03/23.
//

import Foundation

protocol ListOfMovieInterectable {
    func getListOfMovies() async throws -> PopularMovieResponseEntity
}

final class ListOfMovieInteractor: ListOfMovieInterectable {
    let path = Bundle.main.path(forResource: "config", ofType: "plist")!
    
    var apiKey: String {
        let config = NSDictionary(contentsOfFile: path)
        print(config)
        return config?["API_KEY"] as? String ?? ""
    }

    
    func getListOfMovies() async throws -> PopularMovieResponseEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=" + apiKey)!
        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            return try JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
        } catch {
            throw error
        }
        
    }
}
