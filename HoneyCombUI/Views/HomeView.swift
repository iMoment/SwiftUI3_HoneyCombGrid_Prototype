//
//  HomeView.swift
//  HoneyCombUI
//
//  Created by Stanley Pan on 2022/02/16.
//

import SwiftUI

struct HomeView: View {
    // MARK: Current Puzzle
    @State var currentPuzzle: Puzzle = puzzles[0]
    
    var body: some View {
        VStack {
            
            VStack {
                
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "arrowtriangle.backward.square.fill")
                            .font(.title)
                            .foregroundColor(Color.black)
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.title3)
                            .padding(10)
                            .background(Color("customBlue"), in: Circle())
                            .foregroundColor(Color.white)
                    }
                }
                .overlay {
                    Text("Level 1")
                        .fontWeight(.bold)
                }
                
                // MARK: Puzzle Image
                Image(currentPuzzle.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .padding(.vertical)
                
                // MARK: Puzzle Fill Blanks
                HStack(spacing: 10) {
                    ForEach(0..<currentPuzzle.answer.count, id: \.self) { index in
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("customBlue").opacity(0.2))
                                .frame(height: 60)
                        }
                    }
                }
            }
            .padding()
            .background(Color.white, in: RoundedRectangle(cornerRadius: 15))
            
            // MARK: Custom Honey Comb Grid View
            
            // MARK: Next Button
            Button {
                
            } label: {
                Text("Next")
                    .font(.title3.bold())
                    .foregroundColor(Color.white)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color("customBlue"), in: RoundedRectangle(cornerRadius: 15))
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("background"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
