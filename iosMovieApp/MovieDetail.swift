//
//  MovieDetail.swift
//  iosMovieApp
//
//  Created by Parth Mehta on 31/03/26.
//

import SwiftUI

struct MovieDetail: View {
    
    @State var movie:Movie
    @Environment(\.presentationMode) var presentationMode
    
    let newMovie:Bool
    //@ObservedObject var movieStorage: MovieStorage
    @EnvironmentObject var movieStorage: MovieStorage
    
    var body: some View {
        VStack {
            List(){
                Section{
                    SectionTitle(titleText: "Title")
                    TextField("Search", text: $movie.title)
                }
                Section{
                    SectionTitle(titleText: "Rating")
                    HStack{
                        Spacer()
                        Text(String(repeating: "★", count: Int(movie.rating))).foregroundStyle(Color.yellow).font(.title)
                        Spacer()
                    }
                    Slider(value: $movie.rating,in: 1...5,step: 1)
                }
                Section{
                    SectionTitle(titleText:"Seen the movie?")
                    Toggle(isOn: $movie.seen){
                        if movie.title == ""{
                            Text("I have seen this movie")
                        }
                        else{
                            Text("I have seen \(movie.title) ")
                        }
                    }
                }
                
                Section{
                    Button(action:{
                        //This isnused to close the current view in the app and user will navigate to the previous view
                        
                        if newMovie{
                            movieStorage.movies.append(movie)
                        }else{
                            for x in 0..<movieStorage.movies.count{
                                if movieStorage.movies[x].id == movie.id{
                                    movieStorage.movies[x] = movie
                                    break
                                }
                            }
                        }
                        presentationMode.wrappedValue.dismiss()
                    }){
                        HStack{
                            Spacer()
                            Text("save")
                            Spacer()
                        }
                    }.disabled(movie.title.isEmpty)
                }
                
            }.listStyle(GroupedListStyle())
        }
        .padding()
    }
}

#Preview {
   // MovieDetail(movie:  Movie(),newMovie: true,movieStorage: MovieStorage())
    
    //if we use environment object then we no need to pass moviestorage
    MovieDetail(movie:  Movie(),newMovie: true)
}

struct SectionTitle:View {
    var titleText:String
    var body: some View {
        Text(titleText).font(.caption).foregroundStyle(.gray)
    }
}
