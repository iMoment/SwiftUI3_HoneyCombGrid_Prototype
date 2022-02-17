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
    @State var selectedLetters: [Letter] = []
    
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
                    .clipShape(RoundedRectangle(cornerRadius: currentPuzzle.imageName == "shower" ? 100 : 0))
                    .padding(.vertical)
                
                // MARK: Puzzle Fill Blanks
                HStack(spacing: 10) {
                    ForEach(0..<currentPuzzle.answer.count, id: \.self) { index in
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("customBlue").opacity(selectedLetters.count > index ? 1 : 0.2))
                                .frame(height: 60)
                            
                            // MARK: Letter Display
                            if selectedLetters.count > index {
                                Text(selectedLetters[index].value)
                                    .font(.title)
                                    .fontWeight(.black)
                                    .foregroundColor(Color.white)
                            }
                        }
                    }
                }
            }
            .padding()
            .background(Color.white, in: RoundedRectangle(cornerRadius: 15))
            
            // MARK: Custom Honey Comb Grid View
            HoneyCombGridView(items: currentPuzzle.letters) { item in
                // MARK: Hexagon Shape
                ZStack {
                    HexagonShape()
                        .fill(isSelected(letter: item) ? Color("customGold") : Color.white)
                        .aspectRatio(contentMode: .fit)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 10, y: 5)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: -5, y: 8)
                    
                    Text(item.value)
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(isSelected(letter: item) ? Color.white : Color.gray.opacity(0.5))
                    
                }
                .contentShape(HexagonShape())
                .onTapGesture {
                    // MARK: Adding Letter
                    addLetter(letter: item)
                }
            }
            
            // MARK: Next Button
            Button {
                // MARK: Changing to next puzzle
                selectedLetters.removeAll()
                currentPuzzle = puzzles[1]
                generateLetters()
            } label: {
                Text("Next")
                    .font(.title3.bold())
                    .foregroundColor(Color.white)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color("customGold"), in: RoundedRectangle(cornerRadius: 15))
            }
            .disabled(selectedLetters.count != currentPuzzle.answer.count)
            .opacity(selectedLetters.count != currentPuzzle.answer.count ? 0.6 : 1)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("background"))
        .onAppear {
            generateLetters()
        }
    }
    
    func addLetter(letter: Letter) {
        withAnimation {
            if isSelected(letter: letter) {
                selectedLetters.removeAll { currentLetter in
                    return currentLetter.id == letter.id
                }
            } else {
                if selectedLetters.count == currentPuzzle.answer.count { return }
                selectedLetters.append(letter)
            }
        }
    }
    
    func isSelected(letter: Letter) -> Bool {
        return selectedLetters.contains { currentLetter in
            return currentLetter.id == letter.id
        }
    }
    
    func generateLetters() {
        currentPuzzle.jumbledWord.forEach { character in
            currentPuzzle.letters.append(Letter(value: String(character)))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
