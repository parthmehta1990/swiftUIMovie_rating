//
//  ContentView.swift
//  iosMovieApp
//
//  Created by Parth Mehta on 31/03/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var title=""
    @State var rating:Double=3.0
    @State var seen:Bool=false
    
    var body: some View {
        VStack {
            List(){
                Section{
                    SectionTitle(titleText: "Title")
                    TextField("Search", text: $title)
                }
                Section{
                    SectionTitle(titleText: "Rating")
                    HStack{
                        Spacer()
                        Text(String(repeating: "★", count: Int(rating))).foregroundStyle(Color.yellow).font(.title)
                        Spacer()
                    }
                    Slider(value: $rating,in: 1...5,step: 1)
                }
                Section{
                    SectionTitle(titleText:"Seen the movie?")
                    Toggle(isOn: $seen){
                        if title == ""{
                            Text("I have seen this movie")
                        }
                        else{
                            Text("I have seen \(title) ")
                        }
                    }
                }
                
                Section{
                    Button(action:{}){
                        HStack{
                            Spacer()
                            Text("save")
                            Spacer()
                        }
                    }
                }
                
            }.listStyle(GroupedListStyle())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct SectionTitle:View {
    var titleText:String
    var body: some View {
        Text(titleText).font(.caption).foregroundStyle(.gray)
    }
}
