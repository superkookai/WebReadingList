//
//  TryNavigationStack.swift
//  WebReadingList
//
//  Created by Weerawut Chaiyasomboon on 5/12/2567 BE.
//

import SwiftUI

struct TryNavigationStack: View {
    @State private var colorShown: Color?
    
    var body: some View {
        NavigationStack{
            List {
                Button("Mint") { colorShown = .mint }
                Button("Pink") { colorShown = .pink }
                Button("Teal") { colorShown = .teal }
            }
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
