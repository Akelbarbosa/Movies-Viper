//
//  ListOfMovieRoutes.swift
//  Movies
//
//  Created by Akel Barbosa on 18/03/23.
//

import Foundation
import UIKit

final class ListOfMovieRouter {
    func showListOfMovies(window: UIWindow?){
        
        let interactor = ListOfMovieInteractor()
        let presenter = ListOfMoviePresenter(ListOfMovieInteractor: interactor)
        let view = ListOfMovieView(presenter: presenter)
        presenter.ui = view
    
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
