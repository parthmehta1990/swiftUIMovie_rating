//
//  iosMovieAppApp.swift
//  iosMovieApp
//
//  Created by Parth Mehta on 31/03/26.
//

import SwiftUI

@main
struct iosMovieAppApp: App {
    var body: some Scene {
        WindowGroup {
            //MovieDetail(movie:  Movie(),newMovie: true,movieStorage: MovieStorage())
            let movieStorage = MovieStorage()
            MovieList().environmentObject(movieStorage)
        }
    }
}
