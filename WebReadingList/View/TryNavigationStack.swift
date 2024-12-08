//
//  TryNavigationStack.swift
//  WebReadingList
//
//  Created by Weerawut Chaiyasomboon on 5/12/2567 BE.
//

import SwiftUI

struct TryNavigationStack: View {
    @State private var colorShown: Color?
    let colors: [Color] = [.mint,.pink,.teal]
    
    var body: some View {
        NavigationStack{
            List(colors,id:\.self,selection:$colorShown) { color in
                Text(color.description.capitalized)
                    .font(.title2)
            }
            .listStyle(.plain)
            .navigationTitle("Colors")
            .navigationDestination(item: $colorShown) { color in
                ColorDetail(color: color)
            }
        }
    }
}

struct ColorDetail: View {
    let color: Color
    
    var body: some View {
        color
            .ignoresSafeArea()
    }
}

#Preview {
    TryNavigationStack()
}
