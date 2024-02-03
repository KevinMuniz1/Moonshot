//
//  ContentView.swift
//  Moonshot
//
//  Created by Kevin Muniz on 1/28/24.
//

import SwiftUI


struct ContentView: View {
    let astronautDict: [String: Astronaut] = Bundle.main.decodeAstro("astronauts.json")
    let missionArray: [Mission] = Bundle.main.decodeAstro("missions.json")
    
    let item = [GridItem(.adaptive(minimum: 150))]
                        
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: item) {
                    ForEach(missionArray, id: \.id) { mission in
                        NavigationLink {
                            Text("Detail View \(mission.displayName)")
                        } label: {
                            VStack(spacing: 25) {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    
                                    Text(mission.launchDate ?? "N/A")
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                        
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical)
                                .background(.lightBackGround)
                                
                            }.overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.white)
                            )
                            .padding()
                            .navigationTitle("Moonshot")
                            .preferredColorScheme(.dark)
                            
                        }
                    }
                }
            }.background(.DarkBackGround)
        }
    }
}

#Preview {
    ContentView()
}
