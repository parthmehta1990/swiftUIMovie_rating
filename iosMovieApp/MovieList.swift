//
//  MovieList.swift
//  iosMovieApp
//
//  Created by Parth Mehta on 06/04/26.
//

import SwiftUI

struct MovieList: View {

    //var movies: [Movie] = [Movie(title:"Hello")]

    //@ObservedObject var movieStorage: MovieStorage = MovieStorage()

    @EnvironmentObject var movieStorage: MovieStorage

    var body: some View {

        NavigationView {
            List(movieStorage.movies) { currentmovie in
                /*NavigationLink(destination: MovieDetail(movie: currentmovie,newMovie: false,movieStorage: movieStorage)){
                    Text(currentmovie.title)
                }*/
                //if we use environment object then we no need to pass moviestorage
                NavigationLink(
                    destination: MovieDetail(
                        movie: currentmovie,
                        newMovie: false
                    )
                ) {
                    Text(currentmovie.title)
                }

            }.navigationTitle("Movies").navigationBarItems(
                trailing:
                    /*NavigationLink(destination: MovieDetail(movie: Movie(),newMovie: true,movieStorage: movieStorage)){
                        Image(systemName: "plus")
                    }*/
                NavigationLink(
                    destination: MovieDetail(movie: Movie(), newMovie: true)
                ) {
                    Image(systemName: "plus")
                }
            )
        }
    }
}

#Preview {
    MovieList().environmentObject(MovieStorage())
}
