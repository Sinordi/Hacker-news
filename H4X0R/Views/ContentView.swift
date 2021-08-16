//
//  ContentView.swift
//  H4X0R
//
//  Created by Сергей Кривошапко on 24.06.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                        
                    }
                }
                
            }
 
            .navigationBarTitle("H4X0R NEWS")
        }
        
        
        //onAppear можно сравнить в viewDidLoad в UIKit
        .onAppear(perform: {
            networkManager.fetchData()
        })
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
