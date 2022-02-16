//
//  HomeView.swift
//  HoneyCombUI
//
//  Created by Stanley Pan on 2022/02/16.
//

import SwiftUI

struct HomeView: View {
    
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
                }
                
            }
            .padding()
            .background(Color.white, in: RoundedRectangle(cornerRadius: 15))
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
