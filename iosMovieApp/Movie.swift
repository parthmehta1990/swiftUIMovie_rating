//
//  Movie.swift
//  iosMovieApp
//
//  Created by Parth Mehta on 06/04/26.
//

import Foundation
internal import Combine

struct Movie:Identifiable {
    var id : UUID = UUID()
    var title: String = ""
    var rating: Double = 3.0
    var seen: Bool = false
}

class MovieStorage:ObservableObject{
    
    @Published var movies: [Movie] = [Movie]()
}
